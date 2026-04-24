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

set shell=/bin/zsh
set shellcmdflag=-ic
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


"# Delete
nnoremap d "_d
nnoremap D "_D
nnoremap x "_x
vnoremap x "_x
nnoremap s "_s


"# Tab
nnoremap > >>
nnoremap < <<
vnoremap > >gv
vnoremap < <gv


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
" - gruvbox
Plugin 'morhetz/gruvbox'
autocmd vimenter * ++nested colorscheme gruvbox
set bg=dark
let g:gruvbox_contrast_dark='soft'

"# File Browsing
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
nnoremap <leader>sn :NERDTree<CR>


"# Super Searching, <C-p>
Plugin 'junegunn/fzf', { 'dir': '~/opt/fzf' }
Plugin 'junegunn/fzf.vim'
nnoremap <C-p> :Files<CR>
set rtp+=/usr/local/opt/fzf

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"# Multiple Curosr
Plugin 'terryma/vim-multiple-cursors'

Plugin 'tpope/vim-surround'
Plugin 'kshenoy/vim-signature'

Plugin 'tpope/vim-fugitive'
Plugin 'tommcdo/vim-fubitive'
Plugin 'airblade/vim-gitgutter'
set updatetime=100
nnoremap <leader>sg :GitGutterSignsToggle<CR>
nnoremap <leader>gb :Git blame<CR>

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

