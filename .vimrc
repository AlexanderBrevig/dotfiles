language en_US.utf8
set nocompatible
syntax enable
filetype plugin on

" Environment
set t_Co=256
set shell=/usr/bin/zsh
set encoding=utf-8
set number
set relativenumber
set showmode
set showcmd
set ruler
set clipboard=unnamedplus
set splitright
set swapfile
set dir=~/.vimswap


" SEARCH down into subfolders
set path+=**
set wildmenu


" TAGS
command! MakeTags !ctags -R .
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack

" Important remaps
inoremap jk <ESC>
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
let mapleader = " "

" Edit vimrc
nnoremap <leader>ev :vsplit ~/dotfiles/.vimrc<cr>
nnoremap <leader>rv :source ~/dotfiles/.vimrc<cr>

" W and Q
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :q!<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>W :w!<CR>
nnoremap <leader>wq :wq!<CR>

" NAVIGATION
" Tab navigation
nnoremap <C-i> :tabNext<CR>
nnoremap <leader>tn :tabnew<CR>

" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <leader>hs :split<CR><C-W><C-J>
nnoremap <leader>vs :vsplit<CR><C-W><C-L>

" Autocomplete
" - ^x^n for _just_ this file
" - ^x^f for filenames (works with our path trick!)
" - ^x^] for tags only
" - ^n for anything specified by the 'complete' option
" - Use ^n and ^p to go back and forth in the suggestion list
"
call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'w0rp/ale'
Plug 'editorconfig/editorconfig-vim'
call plug#end()

set laststatus=2
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Setup NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
map <leader>b :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>

" Setup syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
