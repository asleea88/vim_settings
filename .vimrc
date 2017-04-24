"##############################################################################
" Temp
"##############################################################################
ia ms mysterySign
ia gs g2sSettings
ia gh g2sHost
ia ge g2sEgm

ia if@ if True:<Return>pass<Return>else:<Return>pass<esc>:?if<CR>w
ia if2@ if True:<Return>pass<Return>elif True:<Return>pass<Return>else:<Return>pass<esc>:?if<CR>nw

ia main@ if __name__ == '__main__':<CR>
ia init@ def<Space>__init__(self):<esc>b
ia call@ def <Space>__call__(self):<esc>b
ia try@ try:<Return>pass<Return>except<Space>Exception<Space>as<Space>e:<Return>self.logger.exception(e)<esc>?pass<CR>

ia class@ class Class(object):<Return><Return>def __init__(self):<Return>pass<esc>?Class<CR>
ia dir@ os.path.dirname(__file__)

"##############################################################################
" AWS
"##############################################################################
ia apsmib@ 13.124.89.161
ia apcomms@ 13.124.84.137
ia apapp@ 13.124.35.9
ia apgame@ 13.124.54.116

ia atsmib@ 13.124.115.209
ia atcomms@ 52.78.186.216
ia atapp@ 52.78.153.13
ia atgame@ 13.124.111.51

"##############################################################################
" User setting
"##############################################################################
let mapleader = "\<Space>"

set clipboard=unnamedplus
set cursorline
set showmatch
set splitbelow
set splitright
set ma
" set smartindent
set nowrap
set mouse=a
set nu
" set completeopt=menu
set completeopt-=preview
set pastetoggle=<F3>
set ic

set tabstop=4
set softtabstop=4
set shiftwidth=4

"# Tmux
set term=screen-256color

"# Switch windows
" nnoremap <C-W>k <C-W><C-J>
" nnoremap <C-W>j <C-W><C-K>
" nnoremap <C-W>l <C-W><C-L>
" nnoremap <C-W>h <C-W><C-H>

"# Wrap word
nnoremap <leader>W' ciW'<C-R>"'<esc>
nnoremap <leader>W" ciW"<C-R>""<esc>
nnoremap <leader>w' ciw'<C-R>"'<esc>
nnoremap <leader>w" ciw"<C-R>""<esc>
nnoremap <leader>wb ciw(<C-R>")<esc>
nnoremap <leader>Wb ciW(<C-R>")<esc>
nnoremap <leader>wB ciw{<C-R>"}<esc>
nnoremap <leader>WB ciW{<C-R>"}<esc>

vnoremap <leader>w' c'<C-R>"'<esc>
vnoremap <leader>w" c"<C-R>""<esc>
vnoremap <leader>wb c(<C-R>")<esc>
vnoremap <leader>wB c{<C-R>"}<esc>

"# Capital


"# Refresh
map <F5> :edit!<CR>
imap <F5> <esc>:edit!<CR>

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

"# Boolean toggle
autocmd FileType python nnoremap <leader>tb :call ToggleBoolean()<CR>
function ToggleBoolean()
	execute "normal! \"zyiw"
	if @z ==# "True"
		execute "normal ciwFalse\<esc>"
	elseif @z ==# "False"
		execute "normal ciwTrue\<esc>"
	else
		execute "echo \"Wrong boolean string\""
	endif
endfunction

"# Trace
map <silent> <leader>b oimport ipdb; ipdb.set_trace()<esc>

"# iabbrev
map <F4> :call Sc()

function Sc(...)
	if a:0 < 2
		execute ":iunabbrev " . a:1
	else
		execute ":iabbrev " . a:1 . " " . a:2
	endif
endfunction

"# Delete
nnoremap d "_d
nnoremap D "_D
nnoremap x "_x
vnoremap x "_x
imap <C-d> <esc>ddi

"# Split line
nnoremap <leader>s, f,wi<Return><esc>
nnoremap <leader>sb %cib<Return><C-r>"<C-t><Return><esc>
nnoremap <leader>sB %ciB<Return><C-r>"<Return><esc>

"# Save
nnoremap <silent> <F2> :w<CR>
inoremap <silent> <F2> <esc>:w<CR>

map QQ :q!<CR>

"# Tab
nnoremap > >>
nnoremap < <<
vnoremap > >gv
vnoremap < <gv

"# Arrow
" nnoremap k j
" nnoremap j k
" vnoremap j k
" vnoremap k j
" onoremap j k
" onoremap k j

"# Move line
nnoremap <silent> <C-Up> :m-2<CR>zz
vnoremap <silent> <C-Up> :m '<-2<CR>gvzz
nnoremap <silent> <C-Down> :m+1<CR>zz
vnoremap <silent> <C-Down> :m '>+1<CR>gvzz
nnoremap <silent> <C-k> :m-2<CR>zz
vnoremap <silent> <C-k> :m '<-2<CR>gvzz
nnoremap <silent> <C-j> :m+1<CR>zz
vnoremap <silent> <C-j> :m '>+1<CR>gvzz

"# Return and BS and esc
nnoremap <leader><Return> I<Return><esc>
nnoremap <leader><Space> i<Space><esc>
nnoremap <leader><Tab> i<Tab><esc><Right>
nnoremap <leader><BS> i<BS><esc><Right>

"# Append
nnoremap <leader>a, :normal $a,<esc>
vnoremap <leader>a, :normal $a,<esc>

imap df <esc>

"# Un-map
vnoremap U <nop>
nnoremap Q <nop>

"# Find
map <leader>mf /for .* in .*:<CR>
map <leader>mF ?for .* in .*:<CR>

map <leader>mC ?class .*:<CR>
map <leader>mc /class .*:<CR>

map <leader>mm /def .*(self\\|cls).*:<CR>
map <leader>mM ?def .*(self\\|cls).*:<CR>

map <leader>mi /if.*:<CR>
map <leader>mI ?if.*:<CR>


"# pretty print
vmap <leader>ppx :!xmllint --format -<CR>
vmap <leader>ppj :%!python -m json.tool<CR>


"# Select all
map <C-a> ggvG<C-c><C-o><C-o>gv

"# Move
map <leader>mh ^
map <leader>me $
map <leader>mw *
map <leader>mW #
map <leader>mb f(
map <leader>mB F(
" map <leader>mb
" omap b (

"# Python
nnoremap <buffer> <F9> :!clear;python %<CR>

"# Highlight selected word
set nohlsearch

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
" call togglebg#map("<F5>")

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
let g:ycm_auto_trigger = 0

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
