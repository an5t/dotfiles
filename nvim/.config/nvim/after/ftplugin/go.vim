setlocal colorcolumn=140

nnoremap <localleader>F :Format gofmt<CR>
vnoremap <localleader>F :Format gofmt<CR>
nnoremap <localleader>I :Format goimports<CR>

map <buffer> <F9> :w<CR>:exec '!go run' shellescape(@%, 1)<CR>
imap <buffer> <F9> <esc>:w<CR>:exec '!go run' shellescape(@%, 1)<CR>
