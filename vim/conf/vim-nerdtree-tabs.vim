" 起動時に自動的にNERDtree有効化
let g:nerdtree_tabs_open_on_console_startup=1
let g:nerdtree_tabs_no_startup_for_diff = 0

" 終了時自動的にNERDTree無効化(Sessionからの復元で多重起動するのを防止する)
autocmd VimLeave * NERDTreeTabsClose
autocmd VimLeave * mksession! ~/Session.vim

command Nt NERDTree
command Nf NERDTreeFind

" let NERDTreeCustomOpenArgs={'file': {'reuse': 'all', 'where': 't'}, 'dir': {}}

function Newtab(infile)
    try
        execute "tab drop " . a:infile
    catch
        execute "tabnew " . a:infile
    endtry
endfunction
command! -nargs=1 -complete=file Tabe call Newtab(<f-args>)
