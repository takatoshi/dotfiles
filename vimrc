"NeoBundleで管理しているプラグインを読み込む
source ~/dotfiles/vimrc.bundle

"vi互換モードオフ
set nocompatible

".vimrcファイル編集と再読み込みコマンド
command! Ev edit $MYVIMRC
command! Gv edit $MYGVIMRC
command! Rv source $MYVIMRC
"バックアップファイル、スワップファイル、viminfoファイル保存場所
"set backupdir=$HOME/vimbackup
"set directory=$HOME/vimbackup
"バックアップファイル、スワップファイル、viminfoファイルを作成しない
set noswapfile
set nobackup
"OSのクリップボードを使用する
"set clipboard+=unnamed
"terminalで256色使う
set t_Co=256
"カラースキーム
colorscheme jellybeans
"現在のディレクトリを開いているディレクトリに変更
set autochdir
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
"タブ周りの基本設定
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set nowrap
set showtabline=2
"カーソルのある行をハイライト(カレントウィンドウのみ)
set cursorline
highlight CursorLine ctermbg=Black
highlight CursorLine ctermfg=Blue

"-------------------------------------------
"編集設定
"-------------------------------------------
"バックスペースでなんでも消せるように
set backspace=indent,eol,start
"オートインデント
set autoindent
"インサートモードでもhjklで移動
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-h> <Left>
imap <C-l> <Right>
"ビジュアルモード時vで行末まで選択
vnoremap v $h
"<C-[>での誤爆を防止する
imap <C-@> <C-[>
"保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge
"保存時に空白行の削除
"autocmd BufWritePre * :g/^$/d
"insertモードを抜けるとIMEオフ
"F4、F5でタブ移動
map <F4> :tabprevious<CR>
map <F5> :tabnext<CR>
"F6で新規タブ
map <f6> :tabnew<cr>
"-------------------------------------------
"検索設定
"-------------------------------------------
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
"phpのインデント設定
au FileType php set ts=4 sw=4 softtabstop=4
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
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
"ビープ音をなくす
set noerrorbells
set novisualbell
set visualbell t_vb=
"タイトル
set title
"ハイライト有効
if &t_Co > 2 || has('gui_running')
  syntax on
endif
"コマンドラインの高さ
set cmdheight=1
set laststatus=2
"コマンドをステータス行表示
set showcmd

"autoload
augroup vimrc-checktime
autocmd!
autocmd WinEnter * checktime
augroup END

"PowerLine設定
let g:Powerline_symbols = 'fancy'

" PHPの辞書補完設定
autocmd BufRead *.php\|*.ctp\|*.tpl :set dictionary=~/.vim/dict/php.dict filetype=php

" Neocomplcacheの設定
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_manual_completion_start_length = 0
let g:neocomplcache_caching_percent_in_statusline = 1
let g:neocomplcache_enable_skip_completion = 1
let g:neocomplcache_skip_input_time = '0.5'

" syntastic設定
let g:syntastic_check_on_open = 1
let g:syntastic_auto_loc_list = 1
"let g:syntastic_auto_jump = 1
let g:syntastic_loc_list_height = 1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"ctagsのタグファイル
set tags+=~/.tags

"[OpenBrowser
nmap <Space>op <Plug>(openbrowser-smart-search)
vmap <Space>op <Plug>(openbrowser-smart-search)

"-------------------------------------------------------------------------------
" unite.vim
"-------------------------------------------------------------------------------
let g:unite_source_menu_menus = {
\   "shortcut" : {
\       "description" : "sample unite-menu",
\       "command_candidates" : [
\           ["unite-file_mru", "Unite file_mru"],
\           ["Unite Beautiful Attack", "Unite -auto-preview colorscheme"],
\           ["unite-output:message", "Unite output:message"],
\           ["Mapping", ":Unite output:map|map!|lmap"],
\       ],
\   },
\}
let g:unite_enable_split_vertically = 1
let g:unite_winwidth = 70
let g:unite_source_history_yank_enable = 1
let g:unite_enable_start_insert = 1
nnoremap <Space>uy :<C-u>Unite history/yank<CR>
nnoremap <Space>ub :<C-u>Unite buffer<CR>
nnoremap <Space>uf :<C-u>UniteWithBufferDir -buffer-name=files -default-action=tabopen file<CR>
nnoremap <Space>ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <Space>uu :<C-u>Unite file_mru buffer -default-action=tabopen<CR>

"p()で囲ってみるテスト
nmap <Space>bp $xyss)^<insert>p<ESC>A;
nmap <Space>bP ^xds)
"$this->つけてみる
nmap <Space>$t <insert>$this-><ESC>

"camelcasemotion
map w  <Plug>CamelCaseMotion_w
map b  <Plug>CamelCaseMotion_b
map e  <Plug>CamelCaseMotion_e

nnoremap [unite] <Nop>
nmap f [unite]

nnoremap <silent> [unite]u :<C-u>Unite<Space>

"-------------------------------------------------------------------------------
" unite-bear
"-------------------------------------------------------------------------------
nnoremap <Space>bh :<C-u>Unite bear/htdocs<CR>
nnoremap <Space>ba :<C-u>Unite bear/App<CR>
nnoremap <Space>bf :<C-u>Unite bear/Form<CR>
"nnoremap <Space>bp :<C-u>Unite bear/Page<CR>
nnoremap <Space>br :<C-u>Unite bear/Ro<CR>
nnoremap <Space>bl :<C-u>Unite bear/libs<CR>
nnoremap <Space>bv :<C-u>Unite bear/views<CR>


"-------------------------------------------------------------------------------
" neosnippet
"-------------------------------------------------------------------------------
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" ユーザー定義スニペット保存ディレクトリ
let g:neocomplcache_snippets_dir = $HOME.'/.vim/snippets'

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

"-------------------------------------------------------------------------------
" vim-fugitive
"-------------------------------------------------------------------------------
nnoremap <silent> <Space>gb :Gblame<CR>
nnoremap <silent> <Space>gd :Gdiff<CR>
nnoremap <silent> <Space>gs :Gstatus<CR>
