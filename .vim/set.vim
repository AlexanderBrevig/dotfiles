filetype plugin indent on
set nocompatible
set backspace=indent,eol,start

set path+=**

set relativenumber
set nu

set autoread
set hidden

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set smartindent
set smartcase
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+

set exrc
set showmatch
set showmode
set nohlsearch
set incsearch
set noerrorbells
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set scrolloff=8
set clipboard+=unnamedplus
set cursorline
set spell spelllang=en_us
set langmenu=en
set ff=unix
" Wild menu settings
set complete-=i
set completeopt=menuone,noinsert,noselect
set wildmenu
set wildmode=longest,list
set wildignorecase
set wildignore+=*.git
set wildignore+=*.png,*.jpeg,*.jpg,*.pdf,*.dds,*.blend,*.gif
set wildignore+=*.dll,*.exe,*.dylib,*.app,*.o,*.obj,*.so,*.lib,*.lnk
set wildignore+=*/node_modules/*,*/build/*,*/__pycache__/*,*/bin/*

" Give more space for displaying messages.
set signcolumn=yes
set cmdheight=2
set laststatus=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set splitright
scriptencoding utf-8
set encoding=utf-8
set fileformat=unix
setglobal termencoding=utf-8 fileencodings=
set isprint=

autocmd BufNewFile,BufRead * try
autocmd BufNewFile,BufRead * set encoding=utf-8
autocmd BufNewFile,BufRead * endtry

if has("autocmd")
    autocmd FileType make set noexpandtab
endif

let loaded_matchparen = 1
let mapleader = " "

" set termguicolors
" set colorcolumn=100
" set t_Co=256
hi Normal guibg=NONE ctermbg=NONE
