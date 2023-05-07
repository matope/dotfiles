"================================================================================
" vim-plug
"================================================================================
call plug#begin('~/.vim/plugged')

Plug 'vim-scripts/Align'
Plug 'vim-jp/vimdoc-ja'
Plug 'preservim/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
" Plug 'git://github.com/jimsei/winresizer.git'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'Shougo/ddc.vim'

" Plug 'vim-denops/denops.vim'

Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'https://github.com/fatih/vim-go.git', { 'do': ':GoUpdateBinaries' }
Plug 'beanworks/vim-phpfmt'
" Plug 'majutsushi/tagbar'
" Plug 'itchyny/lightline.vim'
Plug 'stephpy/vim-yaml'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'alvan/vim-closetag'
Plug 'https://github.com/machakann/vim-swap'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/tyru/open-browser.vim'
" Plug 'SirVer/ultisnips'

" カラースキーマ
Plug 'tomasr/molokai'
let g:molokai_original = 1
let g:rehash256 = 1
Plug 'croaker/mustang-vim'
Plug 'vim-scripts/Wombat'
Plug 'nanotech/jellybeans.vim'
Plug 'vim-scripts/Lucius'
let g:lucius_style='dark'
Plug 'vim-scripts/Zenburn'
Plug 'mrkn/mrkn256.vim'
Plug 'jpo/vim-railscasts-theme'
Plug 'therubymug/vim-pyte'
Plug 'tomasr/molokai'
Plug 'vim-scripts/pyte'
Plug 'w0ng/vim-hybrid'
Plug 'vim-scripts/desert256.vim'
Plug 'vim-scripts/wombat256.vim'

call plug#end()

source ~/.vim/conf/fzf.vim
" source ~/.vim/conf/lightline.vim
" source ~/.vim/conf/neocomplete.vim
source ~/.vim/conf/neosnippet.vim
source ~/.vim/conf/open-browser.vim
" source ~/.vim/conf/tagbar.vim
source ~/.vim/conf/vim-go.vim
source ~/.vim/conf/vim-nerdtree-tabs.vim

"================================================================================
" syntax and colors
"================================================================================
filetype plugin on
filetype indent on
syntax enable

let g:syntastic_javascript_checkers=['eslint']

set background=dark
set number
"ステータスラインを常に表示
set laststatus=2

" 256 color mode
set t_Co=256
set t_Sf=[3%dm
set t_Sb=[4%dm
" tmux内で実行したときに背景色を保護する
set t_ut=

"タブ文字の表示
set list
set listchars=tab:-\ ,trail:\ 

"括弧入力時の対応する括弧を表示
set showmatch

" ラップしない
set textwidth=0

"================================================================================
" tabstop and indents
"================================================================================
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set modelines=0
set smartindent

"================================================================================
" search
"================================================================================
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索で色をつける
set hlsearch
" 検索文字列入力時に順次対象文字列にヒットさせない
set noincsearch
" インクリメンタル検索
set incsearch
" :grepで組み込みのgrepを使う
set grepprg=internal
" *,#による検索時に次の検索結果にジャンプしないようにする
nmap * *N
nmap # #N

"================================================================================
" editing
"================================================================================
" more powerful backspacing
set backspace=indent,eol,start
" C-CでESC
inoremap <C-C> <ESC>
inoremap <silent> jj <ESC>

" Insert モード抜けたら nopaste
autocmd InsertLeave * set nopaste

" Leaderキーを設定
let mapleader = ","

" ,p で:set paste
nnoremap <leader>p :set paste<CR>i

vnoremap <silent> <C-p> "0p<CR>

"================================================================================
" cursor moving
"================================================================================
"表示行単位で行移動する
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
" カーソル移動時の全角半角の判定をうまいことやる
" MEMO: doubleにしてるとfzfが崩れるのでコメントアウトして様子を見る
" set ambiwidth=double 
"
" 前回終了したカーソル行に移動
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
" スクロールオフセット
set scrolloff=5
" スクロールを高速化
set ttyfast

"================================================================================
" completion
"================================================================================
" 辞書ファイルからの単語補間
set complete+=k

" コマンドライン補間をシェルっぽく
set wildmode=list:longest

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

"================================================================================
" buffers
"================================================================================
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 外部のエディタで編集中のファイルが変更されたら自動で読み直す
set autoread

"================================================================================
" windows
"================================================================================
" 新しいウィンドウを下に開く
set splitbelow
" 新しいウィンドウを右に開く
set splitright

"================================================================================
" backup, history
"================================================================================
set nobackup    " Don't keep a backup file
set viminfo='500,<10000,s1000,\"500 " read/write a .viminfo file, don't store more than
set history=1000 " keep 1000 lines of command line history

"================================================================================
" go
"================================================================================
autocmd FileType go :highlight goErr cterm=bold ctermfg=214
autocmd FileType go :match goErr /\<err\>/

" GoBuild時に自動保存をする。via. https://github.com/fatih/vim-go-tutorial
set autowrite

" Ctrl-n/Ctrl-pでquickfixリストを移動する via. https://github.com/fatih/vim-go-tutorial
map <C-n> :cn<CR>
map <C-p> :cp<CR>
nnoremap <leader>a :cclose<CR>


"================================================================================
" Templates
"================================================================================
autocmd BufNewFile *.cpp 0r $HOME/.vim/templates/cpp.txt
autocmd BufNewFile *.cc 0r $HOME/.vim/templates/cpp.txt
autocmd BufNewFile *.sh 0r $HOME/.vim/templates/shell.sh

"================================================================================
" コマンドラインでのキーバインドを Emacs スタイルにする
"===============================================================================
" Ctrl+Aで行頭へ移動
cnoremap <C-A>   <Home>
" Ctrl+Bで一文字戻る
cnoremap <C-B>   <Left>
" Ctrl+Dでカーソルの下の文字を削除
cnoremap <C-D>   <Del>
" Ctrl+Eで行末へ移動
cnoremap <C-E>   <End>
" Ctrl+Fで一文字進む
cnoremap <C-F>   <Right>
" Ctrl+Nでコマンドライン履歴を一つ進む
cnoremap <C-N>   <Down>
" Ctrl+Pでコマンドライン履歴を一つ戻る
cnoremap <C-P>   <Up>
" Alt+Ctrl+Bで前の単語へ移動
cnoremap <Esc><C-B>  <S-Left>
" Alt+Ctrl+Fで次の単語へ移動
cnoremap <Esc><C-F>  <S-Right> 

"================================================================================
" color scheme
"================================================================================
colorscheme molokai

set clipboard+=unnamed

" makeとかをquickfixで開く
au QuickfixCmdPost make,grep,grepadd,vimgrep copen

" diff を縦分割にする
" set diffopt+=vertical

"================================================================================
" autocomplete
"================================================================================
" https://vim-jp.org/vimdoc-ja/options.html#'completeopt'
set completeopt=menuone,noinsert
