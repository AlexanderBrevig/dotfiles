" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
            \| PlugInstall --sync | source $MYVIMRC
            \| endif

call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" LSP
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete-buffer.vim'
Plug 'prabirshrestha/asyncomplete-file.vim'

Plug 'mhinz/vim-signify'

Plug 'editorconfig/editorconfig-vim'

Plug 'dense-analysis/ale'

Plug 'gruvbox-community/gruvbox'

" Language specific
Plug 'jparise/vim-graphql'
Plug 'ap/vim-css-color'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

fun! EmptyRegisters()
    let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
    for r in regs
        call setreg(r, [])
    endfor
endfun

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

set background=dark
colorscheme gruvbox
let g:lightline = {'colorscheme':'gruvbox'}

if executable('rg')
    set grepprg=rg\ --column\ --line-number\ --color=always\ --vimigrep\ --smart-case\ --hidden\ --follow
    let g:rg_derive_root='true'
endif

let g:netrw_browse_split = 0
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:netrw_localrmdir='rm -r'

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

let g:markdown_folding = 1

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']


" LSP
let g:lsp_settings = {
            \'yaml-language-server': {'disabled': v:true},
            \'gemini-ls': {'cmd': ['/home/alexander/.local/share/vim-lsp-settings/servers/gemini-ls/gemini-ls', '--stdio']},
            \'clangd': {'cmd': ['clangd']},
            \'efm-langserver': {'disabled': v:false}
            \}

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)

    inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

    imap <c-space> <Plug>(asyncomplete_force_refresh)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
    \ 'name': 'buffer',
    \ 'allowlist': ['*'],
    \ 'blocklist': ['go'],
    \ 'completor': function('asyncomplete#sources#buffer#completor'),
    \ }))

    au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
    \ 'name': 'file',
    \ 'allowlist': ['*'],
    \ 'priority': 10,
    \ 'completor': function('asyncomplete#sources#file#completor')
    \ }))

    nnoremap <leader>ld :LspDocumentDiagnostic<CR>
    nnoremap <leader>lf :LspDocumentFormat<CR>
    nnoremap <leader>ca :LspCodeAction<CR>
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

if executable('clangd')
    augroup lsp_clangd
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
                    \ 'name': 'clangd',
                    \ 'cmd': {server_info->['clangd']},
                    \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
                    \ })
            autocmd FileType c setlocal omnifunc=lsp#complete
            autocmd FileType cpp setlocal omnifunc=lsp#complete
    augroup end
endif

" LSP
let g_lsp_diagnostics_signs_error = {'text': '█'}
let g:lsp_diagnostics_signs_warning = {'text': '▓'}
let g:lsp_diagnostics_signs_information = {'text' : '▒'}
let g:lsp_diagnostics_signs_hint = {'text': '░'}

" Signify
let g:signify_sign_add               = '▌'
let g:signify_sign_delete            = '▌'
let g:signify_sign_delete_first_line = '▌'
let g:signify_sign_change            = '▌'
let g:signify_sign_change_delete     = g:signify_sign_change . g:signify_sign_delete_first_line

let g:ale_fixers = {
            \ 'javascript': ['prettier'],
            \ 'typescript': ['prettier'],
            \ 'css': ['prettier'],
            \}
let g:ale_fix_on_save = 1
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"
