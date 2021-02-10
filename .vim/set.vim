
syntax enable
filetype plugin indent on

set exrc
set guicursor=
set path+=**
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
set completeopt=menuone,noinsert,noselect
set signcolumn=yes
set clipboard+=unnamedplus
set cursorline
set showmatch
set showmode
set spell spelllang=en_us
set langmenu=en
set ff=unix
" Wild menu settings
set wildmenu
set wildmode=longest,list
set complete-=i
set wildignorecase
set wildignore+=*.git
set wildignore+=*.png,*.jpeg,*.jpg,*.pdf,*.dds,*.blend,*.gif
set wildignore+=*.dll,*.exe,*.dylib,*.app,*.o,*.obj,*.so,*.lib,*.lnk
set wildignore+=*/node_modules/*,*/build/*,*/__pycache__/*,*/bin/*

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

"set colorcolumn=100
set t_Co=256

set splitright

setglobal termencoding=utf-8 fileencodings=
scriptencoding utf-8
set encoding=utf-8
set fileformat=unix
hi Normal guibg=NONE ctermbg=NONE

autocmd BufNewFile,BufRead  *   try
autocmd BufNewFile,BufRead  *   set encoding=utf-8
autocmd BufNewFile,BufRead  *   endtry

let loaded_matchparen = 1
let mapleader = " "

set termguicolors
