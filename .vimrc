"##############################################################################
" Temp
"##############################################################################

:nnoremap <leader>t /%%%<CR><C-O>c3l


" ia @@init def<Space>__init__(self):<esc>b
" ia @@try try:<Return>pass<Return>except<Space>Exception<Space>as<Space>e:<Return>self.logger.exception(e)<esc>?pass<CR>

" ia @@class class Class(object):<Return><Return>def __init__(self):<Return>pass<esc>?Class<CR>
" ia dir@ os.path.dirname(__file__)

nnoremap <leader>t /<template>

ia if!@ if <C-o>mt:<CR>pass<CR>else:<CR>pass<C-o>`t<del>
ia main!@ if __name__ == '__main__':<esc>
ia try!@ try:<CR>pass<CR>except Exception as e:<CR>pass><esc>
ia init!@ def __init__(self):<esc>
ia call!@ def __call__(self):<esc>
ia del!@ def __del__(self):<esc>


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
set tw=80


" set smartindent
set nowrap
set mouse=a
set nu


" set completeopt=menu
set completeopt-=preview
set pastetoggle=<F3>
set ic

set softtabstop=4
set shiftwidth=4
set expandtab
set tabstop=4


"# Tmux
set term=screen-256color


"# grep
:command! -nargs=1 Pg vimgrep <args> **/*.py


"# Annotation
autocmd FileType python map <leader>/ :call ToggleAnno("#")<CR>
autocmd FileType yaml map <leader>/ :call ToggleAnno("#")<CR>
autocmd FileType c map <leader>/ :call ToggleAnno("//")<CR>
autocmd FileType cpp map <leader>/ :call ToggleAnno("//")<CR>
autocmd BufRead,BufNewFile .vimrc map <leader>/ :call ToggleAnno("\"")<CR>

function! ToggleAnno(mark)
	execute "normal! 0"
	let markLen = strlen(a:mark)
	let curChar  = getline('.')[col('.')-1:col('.')-2+markLen]
	let curChar2 = getline('.')[col('.')-1+markLen]

	if curChar ==# a:mark
		if curChar2 ==# "\<Space>"
			let markLen = markLen + 1
		endif

		execute "normal! " . markLen . "x"

	else
		execute "normal! i" . a:mark . "\<Space>"
	endif
endfunction


"# Boolean toggle
autocmd FileType python nnoremap <leader>tb :call ToggleBoolean()<CR>
function! ToggleBoolean()
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
map <silent> <leader>B oimport g2sHost.g2sUtility.ForkPdb; ForkedPdb().set_trace()<esc>


"# iabbrev
map <F4> :call Sc()

function! Sc(...)
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


"# Reflesh .vimrc
nnoremap <F5> :source ~/.vimrc<CR>


"# Split line
nnoremap <leader>s, f,wi<Return><esc>
nnoremap <leader>ss f<Space>wi<Return><esc>
nnoremap <leader>sb %cib<Return><C-r>"<C-t><Return><esc>
nnoremap <leader>sB %ciB<Return><C-r>"<Return><esc>


"# Save
nnoremap <silent> <F2> :w<CR>
inoremap <silent> <F2> <esc>:w<CR>

map QQ :q!<CR>
map qq :q<CR>


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
nnoremap <silent> <C-k> :m-2<CR>zz
vnoremap <silent> <C-k> :m '<-2<CR>gvzz
nnoremap <silent> <C-j> :m+1<CR>zz
vnoremap <silent> <C-j> :m '>+1<CR>gvzz


"# Return and BS and esc
nnoremap <leader><Return> I<Return><esc>
nnoremap <leader><Space> i<Space><esc>


"# Append, Pop, Wrap
nnoremap <leader>a, :normal $a,<esc>
vnoremap <leader>a, :normal $a,<esc>
nnoremap <leader>a; :normal $a;<esc>
vnoremap <leader>a; :normal $a;<esc>
vnoremap <leader>a= :normal $a=<esc>
vnoremap<leader>a: :normal $a:<esc>

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
vnoremap <leader>wd c{<C-R>"}<esc>
vnoremap <leader>wl c[<C-R>"]<esc>
vnoremap <leader>w` c`<C-R>"`<esc>

:command! -range -nargs=1 A <line1>,<line2>s/$/<args>/g
:command! -range -nargs=1 P execute '<line1>,<line2>s/.\{' . <args> . '}$//g'
:command! -range -nargs=1 W <line1>,<line2>s/^\|$/<args>/g

imap df <esc>
vmap df <esc>


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
vmap <leader>ppj :%!jq '.'<CR>


"# Select all
map <C-a> ggvG<C-c><C-o><C-o>gv


"# Move
map <leader>mh ^
map <leader>me $
map <leader>mw *
map <leader>mW #
map <leader>mb f(
map <leader>mB F(

nnoremap <leader>, :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%<' . line('.') . 'l\S', 'be')<CR>zz
nnoremap <leader>. :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%>' . line('.') . 'l\S', 'e')<CR>zz


"# Python
nnoremap <buffer> <F8> :!clear;python %<CR>
nnoremap <buffer> <F9> :!clear;python3.6 %<CR>

function! Py2()
  let g:syntastic_python_python_exec = '/usr/bin/python2.7'
  let g:syntastic_python_flake8_exec = '/usr/local/bin/flake8-py2'
endfunction

function! Py3()
  let g:syntastic_python_python_exec = '/usr/bin/python3.6'
  let g:syntastic_python_flake8_exec = '/usr/local/bin/flake8-py3'
endfunction

call Py3()

nnoremap <leader>ip2 :call Py2()<CR>
nnoremap <leader>ip3 :call Py3()<CR>


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


"# Test
function! T1()
    execute "normal! 0itest\<esc>"
endfunction
function! T2() range
    execute a:firstline . "," . a:lastline . "normal! 0itest\<esc>"
endfunction

vmap t1 :call T()<CR>
vmap t2 :call T2()<CR>
command! -range CT <line1>,<line2>call T1()


"# White space
autocmd BufWritePre * %s/\s\+$//e


"##############################################################################
" autocommand *.py
"##############################################################################
" augroup group_python
	" au Filetype *.py
	" \ set tabstop=4
	" \ set softtabstop=4
	" \ set shiftwidth=4
	" \ set textwidth=79
	" \ set expandtab
	" \ set autoindent
	" \ set fileformat=unix
" augroup END

"##############################################################################
" autocommand
"##############################################################################

augroup group_cpp
    au!
    au BufNewFile,BufRead  *.cpp set tabstop=4 softtabstop=4 expandtab shiftwidth=4 cindent
    au BufNewFile,BufRead  *.h set tabstop=4 softtabstop=4 expandtab shiftwidth=4 cindent
augroup END

augroup group_md
    au!
    au BufNewFile,BufRead *.md vnoremap <leader>B c**<C-R>"**<esc>
augroup END

augroup group_rest
    au!
    au BufNewFile,BufRead *.rest :setlocal filetype=rest
augroup END

"##############################################################################
"
"##############################################################################

autocmd BufEnter *.rules :setlocal filetype=yaml
" autocmd! BufEnter *.rest :setlocal filetype=rest
autocmd BufEnter afiedt.buf :setlocal filetype=sql

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
let g:syntastic_python_checkers = ['flake8']
nnoremap <F6> :SyntasticToggleMode<CR>
" let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': []  }
" nnoremap <F6> :SyntasticCheck<CR>
syntax on
" ignore a line, '# noqa: ErrorCode'

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
:command! NE NERDTree

"# Super Searching, <C-p>
Plugin 'kien/ctrlp.vim'

"# Power Line
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
set laststatus=2

"# Auto-Complete
Plugin 'Valloric/YouCompleteMe'
nnoremap <leader>md :YcmCompleter GoTo<CR>
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
" let g:ycm_server_python_interpreter = '/usr/bin/python3'
" let g:ycm_global_ycm_extra_conf = './.ycm_extra_conf.py'
nnoremap <leader>mr :YcmCompleter GoToReferences<CR>
let g:ycm_auto_trigger = 1

"# Multiple Curosr
Plugin 'terryma/vim-multiple-cursors'

"# Auto Pairs
Plugin 'jiangmiao/auto-pairs'

"# Markdown Previewer
Plugin 'JamshedVesuna/vim-markdown-preview'
let vim_markdown_preview_hotkey='<leader>m'
let vim_markdown_preview_github=1
" let vim_markdown_preview_toggle=2
let vim_markdown_preview_temp_file=1

Plugin 'hdima/python-syntax'

Plugin 'fatih/vim-go'

Plugin 'diepm/vim-rest-console'
let g:vrc_trigger = '<leader>j'
let g:vrc_auto_format_response_enabled = 1
let g:vrc_horizontal_split = 1
let g:vrc_allow_get_request_body = 1
let g:vrc_elasticsearch_support = 1
let g:vrc_curl_opts = {
  \ '--connect-timeout' : 10,
  \ '-b': '/path/to/cookie',
  \ '-c': '/path/to/cookie',
  \ '-L': '',
  \ '--max-time': 60,
  \ '-i': '',
  \ '--ipv4': '',
  \ '-k': '',
\}

