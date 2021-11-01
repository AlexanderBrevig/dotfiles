" Go run files
au FileType go map <leader>- :!go run %
au FileType go map <leader>\ :!go run %<CR>
au FileTYpe go map <leader>' :!go test ./...<CR>
