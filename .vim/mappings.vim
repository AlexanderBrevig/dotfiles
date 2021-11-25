let mapleader = " "

" Find and search
nnoremap <leader>re :Rg .<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>s :BLines<CR>

" Git
nnoremap <leader>gf :Git fetch --all<CR>
nnoremap <leader>gp :Git pull --all<CR>
nnoremap <leader>gs :G<CR>
nnoremap <leader>grum :Git rebase upstream/master<CR>
nnoremap <leader>grom :Git rebase origin/master<CR>

" Difj
nnoremap <leader>du :diffget //2<CR>
nnoremap <leader>dh :diffget //3<CR>

" Resize
nnoremap <leader>+ :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>
nnoremap <leader>vr :vertical resize 100<CR>

" Vim
nnoremap <leader>ghw :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>vso :so ~/.vim/vimrc<CR>
nnoremap <leader>vrc :vsplit ~/.vim/vimrc<CR>

" Move group
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Clipboard manipulation
nnoremap <leader>p "+P
vnoremap <leader>p "_dP
vnoremap <leader>d "+d

nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

" Splits
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>h :split<CR>

" CTRL modifiers
inoremap <C-c> <esc>
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map <C-H> <C-W>h
" > VS Code like find-next-word
nnoremap <C-d> /<C-R>=escape(expand("<cWORD>"), "/")<CR><CR>

" :term mode
nnoremap <leader>> :term<CR>
tnoremap <Esc> <C-\><C-n>

" Sometimes you just type too fast
com! W w
