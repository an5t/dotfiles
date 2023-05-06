setlocal colorcolumn=80

nnoremap <localleader>F :Format black<CR>
vnoremap <localleader>F :Format black<CR>
nnoremap <localleader>I :Format isort<CR>

map <buffer> <F9> :w<CR>:exec '!python' shellescape(@%, 1)<CR>
imap <buffer> <F9> <esc>:w<CR>:exec '!python' shellescape(@%, 1)<CR>
