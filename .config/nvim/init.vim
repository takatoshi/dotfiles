"dein Scripts-----------------------------
if &compatible
  set nocompatible
endif

let s:dein_dir = expand('~/.config/dein')
let s:toml_dir = expand('~/.config/nvim')

set runtimepath+=~/.config/dein/repos/github.com/Shougo/dein.vim

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})
  call dein#load_toml(s:toml_dir . '/lazy.toml', {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

".vimrcファイル編集と再読み込みコマンド
command! Ev edit $MYVIMRC
command! Gv edit $MYGVIMRC
command! Rv source $MYVIMRC
"バックアップファイル、スワップファイル、viminfoファイルを作成しない
set noswapfile
set nobackup
"OSのクリップボードを使用する
set clipboard+=unnamed
"terminalで256色使う
set t_Co=256
"カラースキーム

if filereadable($HOME . "/.vim/bundle/jellybeans.vim/colors/jellybeans.vim")
  colorscheme jellybeans
endif
"現在のディレクトリを開いているディレクトリに変更
"set autochdir
"<Leader>キーの設定
let mapleader = " "
"コマンドライン補完を便利に
set wildmenu

"コマンドラインでの履歴の数
set history=1000
"コマンドラインに文字コード、改行コード表示
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
"他で書き換えられたら自動で読み直す
set autoread
"-------------------------------------------
"表示設定
"-------------------------------------------
"行ナンバー表示
set number
"行の折り返し無し
set nowrap
"タブ周りの基本設定
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set showtabline=4
nmap <C-h> :tabprevious<CR>
nmap <C-l> :tabnext<CR>
"カーソルのある行をハイライト(カレントウィンドウのみ)
set cursorline
set cursorcolumn
highlight CursorLine ctermbg=Black
highlight CursorLine ctermfg=Blue

"-------------------------------------------
"編集設定
"-------------------------------------------
"バックスペースでなんでも消せるように
set backspace=indent,eol,start
"オートインデント
set autoindent
"保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge

"-------------------------------------------
"Search
"-------------------------------------------
"ハイライト
set hlsearch
hi Search term=reverse ctermfg=black ctermbg=yellow
"検索時に大文字小文字を無視 (noignorecase:無視しない)
set ignorecase
"検索時に大文字を含んでいたら大/小を区別
set smartcase
"インクリメントサーチ
set incsearch
"検索語が画面の真ん中に来るようにする †
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz
nmap g; g;zz
nmap g, g,zz
"-------------------------------------------
"キーマッピング設定
"-------------------------------------------
noremap <C-M> <insert><CR><ESC>
"-------------------------------------------
"シンタックス設定
"-------------------------------------------
"htmlのインデント
au FileType html set ts=2 sw=2 softtabstop=2
"xでレジスタに入れないようにする
nnoremap x "_x
"テキスト幅
set textwidth=10
set nolinebreak
"勝手に改行されないようにする
set formatoptions=q
"ファイルを開いたときに、カレントディレクトリを変更
augroup grlcd
  autocmd!
  autocmd BufEnter * lcd %:p:h
augroup END
"エンコーディング
set termencoding=utf-8
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,shift-jis,euc-jp
set fileformats=unix,mac,dos
"不可視文字を表示
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%
"ビープ音をなくす
set noerrorbells
set novisualbell
set visualbell t_vb=
"タイトル
"set title
"ハイライト有効
if &t_Co > 2 || has('gui_running')
  syntax on
endif
"コマンドラインの高さ
set cmdheight=1
set laststatus=2
"コマンドをステータス行表示
set showcmd
" ノーマルモード時だけ ; と : を入れ替える
nnoremap ; :

set splitright
