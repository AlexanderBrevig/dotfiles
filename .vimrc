language en_US.utf8
set nocompatible
syntax enable
filetype plugin on

" Environment
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

" BROWSE using :edit
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings

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
