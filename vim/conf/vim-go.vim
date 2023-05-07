let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

"let g:syntastic_mode_map = {'mode': 'active', 'active_filetypes': ['go'] }
"let g:syntastic_go_checkers = ['govet', 'golangci-lint']
"let g:go_list_type = "quickfix"
let g:go_gopls_matcher = "fuzzy"

let g:UltiSnipsUsePythonVersion    = 3
let g:UltiSnipsEditSplit           = 'normal'
let g:UltiSnipsEnableSnipMate      = 0
let g:UltiSnipsExpandTrigger       = '<c-k>'
let g:UltiSnipsJumpForwardTrigger  = '<c-f>'
let g:UltiSnipsJumpBackwardTrigger = '<c-b>'
command! SNIP UltiSnipsEdit

" call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*', 'smart_case': v:true })

au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>e <Plug>(go-rename)

" . を入力すると自動的に補完が起動
" https://dev.to/jogendra/using-vim-for-go-development-5hc6
au filetype go inoremap <buffer> . .<C-x><C-o>

" noinsert: 補完候補を自動で挿入しない
" set completeopt=menuone,noinsert

autocmd FileType go nmap <leader>b <Plug>(go-build)
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>t <Plug>(go-test)

