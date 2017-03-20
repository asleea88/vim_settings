"##############################################################################
" Temp
"##############################################################################
iabbrev ms mysterySign
iabbrev gs g2sSettings
iabbrev main: if __name__ == '__main__':

"##############################################################################
" User setting
"##############################################################################
let mapleader = "\<Space>"

set clipboard=unnamed
set cursorline
set showmatch
set splitbelow
set splitright
set ma
set nowrap
set mouse=a
set nu
set completeopt=menu
set pastetoggle=<F3>

set tabstop=4
set softtabstop=4
set shiftwidth=4

"# Switch windows
nnoremap <C-W>/ <C-W><C-J>
nnoremap <C-W>[ <C-W><C-K>
nnoremap <C-W>' <C-W><C-L>
nnoremap <C-W>; <C-W><C-H>

"# quotes
nnoremap <leader>W' ciW'<C-R>"'<esc>
nnoremap <leader>W" ciW"<C-R>""<esc>
nnoremap <leader>w' ciw'<C-R>"'<esc>
nnoremap <leader>w" ciw"<C-R>""<esc>

"# Annotation
autocmd FileType python map <leader>/ :call ToggleAnno("#")<CR>
autocmd BufRead,BufNewFile .vimrc map <leader>/ :call ToggleAnno("\"")<CR>

function ToggleAnno(mark)
	execute "normal! ^"
	let curChar  = getline('.')[col('.')-1]
	let curChar2 = getline('.')[col('.')]
	if curChar ==# a:mark
		if curChar2 ==# "\<Space>"
			execute "normal! 2x"
		else
			execute "normal! x"
		endif
	else
		execute "normal! i" . a:mark . "\<Space>"
	endif
endfunction

"# Trace
map <silent> <leader>b oimport pdb; pdb.set_trace()<esc>

"# Delete
nnoremap d "_d
nnoremap D "_D
nnoremap x "_x
vnoremap x "_x
imap <C-d> <esc>ddi
nmap <C-d> dd

"# Split line
nnoremap <leader>s, f,wi<Return><esc>
nnoremap <leader>sb %cib<Return><C-r>"<C-t><Return><esc>
nnoremap <leader>sB %ciB<Return><C-r>"<Return><esc>

"# Save
nnoremap <F2> :w<CR>
inoremap <F2> <esc>:w<CR>

map QQ :q!<CR>

"# Tab
nnoremap > >>
nnoremap < <<
vnoremap > >gv
vnoremap < <gv

"# Move line
nnoremap <silent> <C-Up> :m-2<CR>zz
vnoremap <silent> <C-Up> :m '<-2<CR>gvzz
nnoremap <silent> <C-Down> :m+1<CR>zz
vnoremap <silent> <C-Down> :m '>+1<CR>gvzz

"# Return and BS and esc
nnoremap <leader><Return> I<Return><esc>
nnoremap <leader><Space> i<Space><esc>
nnoremap <leader><Tab> i<Tab><esc><Right>
nnoremap <leader><BS> i<BS><esc><Right>

imap ff <esc>
vmap ff <esc>

"# Un-map
:vnoremap U <nop>

"# Highlight selected word
set nohlsearch

"# Find
map <leader>mf /for .* in .*:<CR>
map <leader>mF ?for .* in .*:<CR>

map <leader>mC ?class .*:<CR>
map <leader>mc /class .*:<CR>

map <leader>mm /def .*(self\\|cls).*:<CR>
map <leader>mM ?def .*(self\\|cls).*:<CR>

map <leader>mi /if.*:<CR>
map <leader>mI ?if.*:<CR>


"# Select all
map <C-a> ggvG<C-c><C-o><C-o>gv

"# Move
map <leader>mh ^
map <leader>me $
" map <leader>mb
omap b (

nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
	  let @/ = ''
	if exists('#auto_highlight')
		set nohlsearch
		au! auto_highlight

		augroup! auto_highlight
		setl updatetime=500
		echo 'Highlight current word: off'
		return 0
	else
		set hlsearch
		augroup auto_highlight
			au!
			au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
		augroup end
		setl updatetime=500
		echo 'Highlight current word: ON'
		return 1
	endif
endfunction


"# White space
autocmd BufWritePre * %s/\s\+$//e
"nnoremap <leader>c :%s/\s\+$//e<CR>


"##############################################################################
" *.py
"##############################################################################
au BufNewFile,BufRead *.py
    \set tabstop=4
    \set softtabstop=4
    \set shiftwidth=4
    \set textwidth=79
    \set expandtab
    \set autoindent
    \set fileformat=unix

"highlight BadWhitespace ctermbg=red guibg=red
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
"au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/



au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2


"##############################################################################
" Vundle init
"##############################################################################

set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


"##############################################################################
" Plug in
"##############################################################################

"# Audo-indent
Plugin 'vim-scripts/indentpython.vim'

"# Syntax Checking/Highlighting
Plugin 'scrooloose/syntastic'
let python_highlight_all=1
syntax on

"# PEP8 Checking
Plugin 'nvie/vim-flake8'
let g:flake8_error_marker='EE'     " set error marker to 'EE'
let g:flake8_warning_marker='WW'   " set warning marker to 'WW'
let g:flake8_pyflake_marker=''     " disable PyFlakes warnings
let g:flake8_complexity_marker=''  " disable McCabe complexity warnings
let g:flake8_naming_marker=''      " disable naming warnings
let g:flake8_quickfix_height=7
let g:flake8_show_quickfix=1


"# Color Schema
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
if has('gui_running')
    set background=dark
    colorscheme solarized
else
    colorscheme zenburn
endif
call togglebg#map("<F5>")

"# File Browsing
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
:command NE NERDTree

"# Super Searching
Plugin 'kien/ctrlp.vim'

"# Power Line
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

"# Auto-Complete
Plugin 'Valloric/YouCompleteMe'
nnoremap <leader>md :YcmCompleter GoTo<CR>
nnoremap <leader>mr :YcmCompleter GoToReferences<CR>

"# Nevigate indentation
Plugin 'jeetsukumaran/vim-indentwise'
map <leader>] <Plug>(IndentWiseNextEqualIndent)
map <leader>[ <Plug>(IndentWisePreviousEqualIndent)

"map [- <Plug>(IndentWisePreviousLesserIndent)
"map [= <Plug>(IndentWisePreviousEqualIndent)
"map [+ <Plug>(IndentWisePreviousGreaterIndent)
"map ]- <Plug>(IndentWiseNextLesserIndent)
"map ]= <Plug>(IndentWiseNextEqualIndent)
"map ]+ <Plug>(IndentWiseNextGreaterIndent)
"map [_ <Plug>(IndentWisePreviousAbsoluteIndent)
"map ]_ <Plug>(IndentWiseNextAbsoluteIndent)
"map [% <Plug>(IndentWiseBlockScopeBoundaryBegin)
"map ]% <Plug>(IndentWiseBlockScopeBoundaryEnd)

"# Multiple Curosr
Plugin 'terryma/vim-multiple-cursors'

"# Esay grep
Plugin 'dkprice/vim-easygrep'

"# Auto Pairs
Plugin 'jiangmiao/auto-pairs'


"function Test1(name)
"	echom a:name
"endfunction
"
"function Test2(...)
"	echom a:0
"	echom a:1
"	echo a:000
"endfunction
