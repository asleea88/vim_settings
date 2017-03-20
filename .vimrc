"##############################################################################
" Temp
"##############################################################################

nnoremap <leader>t /%%%<CR><C-O>c3l


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
" User setting
"##############################################################################
let mapleader = "\<Space>"

" set clipboard=unnamedplus  # It didn't work in mac
set clipboard=unnamed
set cursorline
set showmatch
set splitbelow
set splitright
set ma
set cc=80
set backspace=indent,eol,start

set shell=/bin/bash
" set smartindent
" set nowrap
set mouse=a
set nu


" set completeopt=menu
set completeopt-=preview
set pastetoggle=<F3>
set ic

set softtabstop=4
set shiftwidth=4
set tabstop=4
set expandtab

nnoremap <leader>q1 :q!<CR>
nnoremap <leader>wq :wq<CR>
nnoremap <leader>ww :w<CR>

nnoremap <leader>sp :split<CR>
nnoremap <leader>vs :vsplit<CR>

nnoremap <leader>ann 79i#<esc>YpO#<Space>

"# Tmux
set term=screen-256color


"# grep
:command! -nargs=1 Pg vimgrep <args> **/*.py


"# Annotation
autocmd FileType yaml map <leader>/ :call ToggleAnno("#")<CR>
autocmd FileType c map <leader>/ :call ToggleAnno("//")<CR>
autocmd FileType cpp map <leader>/ :call ToggleAnno("//")<CR>
autocmd BufRead,BufNewFile .vimrc map <leader>/ :call ToggleAnno("\"")<CR>

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

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

"# Syntax
nnoremap <F12> :syntax sync fromstart<CR>
inoremap <F12> <esc>:syntax sync fromstart<CR>

"# Save
nnoremap <silent> <F2> :w<CR>
inoremap <silent> <F2> <esc>:w<CR>

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


"# copen, nevigate
nnoremap <silent> <leader>n :cn<CR>
nnoremap <silent> <leader>p :cp<CR>
nnoremap <silent> <leader>cc :cclose<CR>
nnoremap <silent> <leader>co :copen<CR>


"# Return and BS and esc
nnoremap <leader><Return> I<Return><esc>
nnoremap <leader><Space> i<Space><esc>


"# Append, Pop, Wrap
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
map <leader>A ggvG<C-c><C-o><C-o>gv


"# Move

nnoremap <leader>, :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%<' . line('.') . 'l\S', 'be')<CR>zz
nnoremap <leader>. :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%>' . line('.') . 'l\S', 'e')<CR>zz

"# Python
function! Py2()
    let py2exec = system('printf %s "$(which python2.7)"')
    let py2flake = system('printf %s "$(which flake8-py2)"')
    let g:syntastic_python_python_exec = py2exec
    let g:syntastic_python_flake8_exec = py2flake
    let g:ycm_python_binary_path = py2exec
endfunction

function! Py3()
    let py3exec = system('printf %s "$(which python3.6)"')
    let py3flake = system('printf %s "$(which flake8-py3)"')
    let g:syntastic_python_python_exec = py3exec
    let g:syntastic_python_flake8_exec = py3flake
    let g:ycm_python_binary_path = py3exec
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

augroup group_python
    au!
    " au FileType python map <leader>/ :call ToggleAnno("#")<CR>
    autocmd FileType apache setlocal commentstring=#\ %s
    au FileType python nnoremap <F9> :!clear && python3.6 %<CR>
    au FileType python vnoremap <F9> :w !python3.6<CR>
    au FileType python set foldmethod=indent
    au FileType python set nofoldenable

augroup END

augroup group_bash
    au!
    " au FileType sh map <leader>/ :call ToggleAnno("#")<CR>
    autocmd FileType apache setlocal commentstring=#\ %s
    au FileType sh nnoremap <F9> :!clear && sh %<CR>
    au FileType sh vnoremap <F9> :w !sh<CR>
    " au FileType sh nnoremap <F9> :call VimuxRunCommand("clear; sh " . bufname("%"))<CR>
    " au FileType sh vnoremap <F9> :call VimuxRunCommand("clear; sh " . bufname("%"))<CR>
    " au FileType sh nnoremap <F9> :call VimuxRunCommandInDir("clear; sh " . bufname("%"), 1)<CR>
    " au FileType sh vnoremap <F9> :call VimuxRunCommandInDir("clear; sh " . bufname("%"), 1)<CR>
augroup END

"##############################################################################
"
"##############################################################################

autocmd BufEnter *.rules :setlocal filetype=yaml
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
"
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
"
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0


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
nnoremap <leader>sn :NERDTree<CR>


"# Super Searching, <C-p>
Plugin 'junegunn/fzf.vim'
nnoremap <C-p> :Files<CR>
set rtp+=/usr/local/opt/fzf

"# Power Line
Plugin 'itchyny/lightline.vim'
set laststatus=2
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'relativepath', 'modified' ] ]
      \ }
      \ }

"# Rest
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

"# Auto-Complete
Plugin 'Valloric/YouCompleteMe'
nnoremap <leader>md :YcmCompleter GoToDefinition<CR>
nnoremap <leader>mD :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>mg :YcmCompleter GoTo<CR>
nnoremap <leader>mr :YcmCompleter GoToReferences<CR>
nnoremap <leader>gd :YcmCompleter GetDoc<CR>
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_auto_trigger = 0

"# Multiple Curosr
Plugin 'terryma/vim-multiple-cursors'

"# Auto Pairs
Plugin 'jiangmiao/auto-pairs'

"# Markdown Previewer
Plugin 'JamshedVesuna/vim-markdown-preview'
let vim_markdown_preview_hotkey='<leader>m'
let vim_markdown_preview_github=1
" let vim_markdown_preview_toggle=2
" let vim_markdown_preview_temp_file=1

Plugin 'hdima/python-syntax'

Plugin 'fatih/vim-go'

" Plugin 'Rykka/riv.vim'

Plugin 'nathanaelkane/vim-indent-guides'
" let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_indent_levels = 5
nnoremap <leader>si :IndentGuidesToggle<CR>

" Plugin 'benmills/vimux'

Plugin 'tpope/vim-surround'
Plugin 'kshenoy/vim-signature'
" Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-fugitive'
" Plugin 'airblade/vim-gitgutter'
" nnoremap <leader>sg :GitGutterToggle<CR>

Plugin 'majutsushi/tagbar'
nnoremap <leader>st :TagbarToggle<CR>

Plugin 'tpope/vim-commentary'
" Plugin 'scrooloose/nerdcommenter'

" Plugin 'SirVer/ultisnips'

Plugin 'mileszs/ack.vim'
cnoreabbrev Ack Ack!

Plugin 'easymotion/vim-easymotion'

" function! s:config_easyfuzzymotion(...) abort
"   return extend(copy({
"   \   'converters': [incsearch#config#fuzzyword#converter()],
"   \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
"   \   'keymap': {"\<CR>": '<Over>(easymotion)'},
"   \   'is_expr': 0,
"   \   'is_stay': 1
"   \ }), get(a:, 1, {}))
" endfunction

Plugin 'haya14busa/incsearch.vim'
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" Plugin 'junegunn/vim-easy-align'
" " Start interactive EasyAlign in visual mode (e.g. vipga)
" xmap ga <Plug>(EasyAlign)
" " Start interactive EasyAlign for a motion/text object (e.g. gaip)
" nmap ga <Plug>(EasyAlign)

" Track the engine.
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Plugin 'lunarxlark/aws-cfn-snippet.vim'
" Plugin 'Shougo/neosnippet.vim'
" let g:neosnippet#snippets_directory='~/.vim/snippets/'
" imap <C-K> <Plug>(neosnippet_expand_or_jump)
