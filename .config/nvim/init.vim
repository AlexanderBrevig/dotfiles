inoremap jk <ESC>
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
let mapleader = " "
filetype plugin indent on
syntax on
set shell=alacritty
set encoding=utf-8
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

" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-L>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

set swapfile
set dir=~/.nvimswap

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
Plug 'iCyMind/NeoSolarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

set termguicolors
colorscheme NeoSolarized
set background=dark

let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_theme='solarized'
let g:airline_solarized_bd='dark'

" Configure NERDTree
nnoremap <Leader>f :NERDTreeToggle<Enter>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
" Auto close tab if only remaining is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
