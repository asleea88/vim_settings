"##############################################################################
" User setting
"##############################################################################
let mapleader = " "

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
nnoremap <leader>qq :q<CR>
nnoremap <leader>qa :qa<CR>
nnoremap <leader>wq :wq<CR>
nnoremap <leader>W :w<CR>
nnoremap <leader>wa :wa<CR>
vnoremap <leader>q1 <esc>:q!<CR>
vnoremap <leader>wq <esc>:wq<CR>
vnoremap <leader>ww <esc>:w<CR>

nnoremap <leader>sp :split<CR>
nnoremap <leader>vs :vsplit<CR>

nnoremap <leader>ann 79i#<esc>YpO#<Space>

"# Tmux
set term=screen-256color


"# grep
:command! -nargs=1 Pg vimgrep <args> **/*.py


autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

"# Trace
map <silent> <leader>b oimport ipdb; ipdb.set_trace()<esc>

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
nnoremap <silent> ˚ :m-2<CR>zz
vnoremap <silent> ˚ :m '<-2<CR>gvzz
nnoremap <silent> ∆ :m+1<CR>zz
vnoremap <silent> ∆ :m '>+1<CR>gvzz


"# copen, nevigate
nnoremap <silent> <leader>n :cn<CR>
nnoremap <silent> <leader>p :cp<CR>
nnoremap <silent> <leader>cc :cclose<CR>
nnoremap <silent> <leader>co :copen<CR>


"# Return and BS and esc
nnoremap <leader><Return> I<Return><esc>
nnoremap <leader><Space> i<Space><esc>
" inoremap .. <esc>A
" inoremap ,, <esc>o

:command! -range -nargs=1 A <line1>,<line2>s/$/<args>/g
:command! -range -nargs=1 P execute '<line1>,<line2>s/.\{' . <args> . '}$//g'
:command! -range -nargs=1 W <line1>,<line2>s/^\|$/<args>/g

imap df <esc>
vmap df <esc>

"# pretty print
vmap <leader>ppx :!xmllint --format -<CR>
vmap <leader>ppj :%!jq '.'<CR>
vmap <leader>pps :%!sqlformat --reindent --keywords upper --identifiers lower -<CR>


"# Python
function! Py2()
    let py2exec = system('printf %s "$(which python2.7)"')
    let py2flake = system('printf %s "$(which flake8)"')
    let g:syntastic_python_python_exec = py2exec
    let g:syntastic_python_flake8_exec = py2flake
    let g:ycm_python_binary_path = py2exec
endfunction

function! Py3()
    let py3exec = system('printf %s "$(which python3)"')
    let py3flake = system('printf %s "$(which flake8)"')
    let g:syntastic_python_python_exec = py3exec
    let g:syntastic_python_flake8_exec = py3flake
    let g:ycm_python_binary_path = py3exec
endfunction

call Py3()

nnoremap <leader>ip2 :call Py2()<CR>
nnoremap <leader>ip3 :call Py3()<CR>


"# Highlight selected word
set nohlsearch

"# White space
autocmd BufWritePre * %s/\s\+$//e

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
    autocmd FileType apache setlocal commentstring=#\ %s
    au FileType python nnoremap <F9> :!clear && python3 %<CR>
    au FileType python vnoremap <F9> :w !python3<CR>
    au FileType python set foldmethod=indent
    au FileType python set nofoldenable

augroup END

augroup group_bash
    au!
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
" execute pathogen#infect()
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


"# Auto complete
Plugin 'davidhalter/jedi-vim'
let g:jedi#goto_command = "<leader>md"
let g:jedi#usages_command = "<leader>mr"

"# Multiple Curosr
Plugin 'terryma/vim-multiple-cursors'

"# Auto Pairs
Plugin 'jiangmiao/auto-pairs'

"# Markdown Previewer
Plugin 'JamshedVesuna/vim-markdown-preview'
let vim_markdown_preview_hotkey='<leader>sm'
let vim_markdown_preview_github=1
" let vim_markdown_preview_toggle=2
" let vim_markdown_preview_temp_file=1

Plugin 'hdima/python-syntax'

Plugin 'fatih/vim-go'

Plugin 'nathanaelkane/vim-indent-guides'
" let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_indent_levels = 5
nnoremap <leader>si :IndentGuidesToggle<CR>

Plugin 'tpope/vim-surround'
Plugin 'kshenoy/vim-signature'

Plugin 'tpope/vim-fugitive'
Plugin 'tommcdo/vim-fubitive'
Plugin 'airblade/vim-gitgutter'
set updatetime=100
nnoremap <leader>sg :GitGutterSignsToggle<CR>
" nmap ]h <Plug>(GitGutterNextHunk)
" nmap [h <Plug>(GitGutterPrevHunk)

Plugin 'majutsushi/tagbar'
nnoremap <leader>st :TagbarToggle<CR>

Plugin 'tpope/vim-commentary'
" Plugin 'scrooloose/nerdcommenter'

Plugin 'mileszs/ack.vim'
cnoreabbrev Ack Ack!

Plugin 'easymotion/vim-easymotion'

let g:EasyMotion_smartcase = 1
map <leader>e <Plug>(easymotion-prefix)
" nmap t <Plug>(easymotion-t2)

Plugin 'haya14busa/incsearch.vim'
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

function! s:noregexp(pattern) abort
  return '\V' . escape(a:pattern, '\')
endfunction

function! s:config() abort
  return {'converters': [function('s:noregexp')]}
endfunction

noremap <silent><expr> z/ incsearch#go(<SID>config())

"# Snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
set rtp+=~/.vim/my-snippets/

" set rtp+=~/.vim/bundle/vim-snippets
let g:UltiSnipsExpandTrigger="<C-l>"
let g:UltiSnipsListSnippets="<C-tab>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
" :UltiSnipsEdit
let g:UltiSnipsEditSplit="vertical"
" let g:UltiSnipsSnippetsDir = '~/.vim/bundle/vim-snippets/UltiSnips'
" let g:UltiSnipsSnippetsDir = '~/vim_settings/snippets'
" let g:UltiSnipsSnippetDirectories=["UltiSnips", ".vim/bundle/aws-vim/snips"]
" let g:UltiSnipsSnippetDirectories=["UltiSnips", "~/vim_settings/snippets"]

Plugin 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_disable_when_zoomed = 0

Plugin 'tpope/vim-repeat'
Plugin 'godlygeek/tabular'
Plugin 'dhruvasagar/vim-zoom'  " <C-w>m

Plugin 'alfredodeza/pytest.vim'
Plugin 'janko/vim-test'

Plugin 'dhruvasagar/vim-table-mode'
