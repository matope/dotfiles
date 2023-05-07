"--------------------------------------------------------------------------------
" lightline
"--------------------------------------------------------------------------------
let g:lightline = {
      \ 'colorscheme': 'default',
      \ 'component': {
      \   'readonly': '%{&readonly?"⭤":""}',
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

" statuslineのファイル名を相対パスに変更
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'filename': '%f'
      \   }
      \ }

let g:lightline.enable = {
    \ 'statusline': 1,
    \ 'tabline': 0
    \ }
