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
nnoremap s "_s


"# Split line
nnoremap <leader>s, f,wi<Return><esc>
nnoremap <leader>ss f<Space>wi<Return><esc>
nnoremap <leader>sb %cib<Return><C-r>"<C-t><Return><esc>
nnoremap <leader>sB %ciB<Return><C-r>"<Return><esc>

"# Tab
nnoremap > >>
nnoremap < <<
vnoremap > >gv
vnoremap < <gv

imap df <esc>
vmap df <esc>

" 한글 (두벌식 자판 기준)
imap ㅇㄹ <ESC>
vmap ㅇㄹ <ESC>

"# Highlight selected word
set nohlsearch

"##############################################################################
" Vundle init
"##############################################################################

set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

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
"
" - gruvbox
Plugin 'morhetz/gruvbox'
autocmd vimenter * ++nested colorscheme gruvbox
set bg=dark
let g:gruvbox_contrast_dark='soft'

"# File Browsing
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
:command! NE NERDTree
nnoremap <leader>sn :NERDTree<CR>


"# Super Searching, <C-p>
Plugin 'junegunn/fzf', { 'dir': '~/opt/fzf' }
Plugin 'junegunn/fzf.vim'
nnoremap <C-p> :Files<CR>
set rtp+=/usr/local/opt/fzf

"# Power Line
" Plugin 'itchyny/lightline.vim'
" set laststatus=2
" let g:lightline = {
"       \ 'active': {
"       \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'relativepath', 'modified' ] ]
"       \ }
"       \ }
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

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
nnoremap <leader>gb :Git blame<CR>

Plugin 'majutsushi/tagbar'
nnoremap <leader>st :TagbarToggle<CR>

Plugin 'tpope/vim-commentary'

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

Plugin 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_disable_when_zoomed = 0

