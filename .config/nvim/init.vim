inoremap jk <ESC>
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
let mapleader = " "
filetype plugin indent on
syntax on
set t_Co=256
set shell=/usr/bin/zsh
set encoding=utf-8
set guifont=Menlo:h14
set number
set relativenumber
set ttyfast
set ruler
set autoindent
set showmode
set showcmd
set modelines=0
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set clipboard=unnamedplus

call plug#begin()
"Plug 'roxma/nvim-completion-manager'
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
"Plug 'sickill/vim-pasta'
Plug 'airblade/vim-gitgutter'
"Plug 'ervandew/supertab'
"Plug 'eugen0329/vim-esearch'
"Plug 'kien/ctrlp.vim'
Plug 'vim-syntastic/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()