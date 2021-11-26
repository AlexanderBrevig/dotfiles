" Place global autocommands here
augroup ALEXANDER_BREVIG
    autocmd!

    autocmd BufNewFile,BufRead * try
    autocmd BufNewFile,BufRead * set encoding=utf-8
    autocmd BufNewFile,BufRead * endtry

    autocmd FileType make set noexpandtab
augroup END
