
" Note: Skip initialization for vim-tiny or vim-small.
 if 0 | endif

 if &compatible
   set nocompatible               " Be iMproved
 endif

 " Required:
 set runtimepath^=~/.vim/bundle/neobundle.vim/

 " Required:
 call neobundle#rc(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 " Required:
 NeoBundleFetch 'Shougo/neobundle.vim'

"NeoBundleで管理しているプラグインを読み込む
source ~/dotfiles/vimrc.bundle

"vi互換モードオフ
set nocompatible

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
let g:neocomplcache_enable_at_startup              = 1
let g:neocomplcache_enable_camel_case_completion   = 1
let g:neocomplcache_enable_underbar_completion     = 1
let g:neocomplcache_smart_case                     = 1
let g:neocomplcache_min_syntax_length              = 3
let g:neocomplcache_manual_completion_start_length = 0
let g:neocomplcache_caching_percent_in_statusline  = 1
let g:neocomplcache_enable_skip_completion         = 1
let g:neocomplcache_skip_input_time                = '0.5'

" syntastic設定
let g:syntastic_check_on_open   = 1
let g:syntastic_auto_loc_list   = 1
"let g:syntastic_auto_jump      = 1
let g:syntastic_loc_list_height = 1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"ctags設定
set tags+=.tags;
" tagsジャンプの時に複数ある時は一覧表示
nnoremap <C-]> g<C-]>

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
let g:unite_enable_split_vertically    = 1
let g:unite_winwidth                   = 70
let g:unite_source_history_yank_enable = 1
let g:unite_enable_start_insert        = 1
nnoremap <Space>uy :<C-u>Unite history/yank<CR>
nnoremap <Space>ub :<C-u>Unite buffer<CR>
nnoremap <Space>uf :<C-u>UniteWithBufferDir -buffer-name=files -default-action=tabopen file<CR>
nnoremap <Space>ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <Space>uu :<C-u>Unite file_mru buffer -default-action=tabopen<CR>

"p()で囲ってみるテスト
nmap <Leader>p $xyss)^<insert>p<ESC>A;
nmap <Leader>P ^xds)
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
nnoremap <Space>bh :<C-u>Unite bear/htdocs -default-action=tabopen<CR>
nnoremap <Space>ba :<C-u>Unite bear/App -default-action=tabopen<CR>
nnoremap <Space>bf :<C-u>Unite bear/Form -default-action=tabopen<CR>
nnoremap <Space>bp :<C-u>Unite bear/Page<CR>
nnoremap <Space>br :<C-u>Unite bear/Ro -default-action=tabopen<CR>
nnoremap <Space>bl :<C-u>Unite bear/libs -default-action=tabopen<CR>
nnoremap <Space>bv :<C-u>Unite bear/views -default-action=tabopen<CR>

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
let g:neosnippet#snippets_directory= $HOME.'/.vim/snippets'

"-------------------------------------------------------------------------------
" vim-fugitive
"-------------------------------------------------------------------------------
nnoremap <silent> <Space>gb :Gblame<CR>
nnoremap <silent> <Space>gd :Gdiff<CR>
nnoremap <silent> <Space>gs :Gstatus<CR>

"-------------------------------------------------------------------------------
" vimfiler
"-------------------------------------------------------------------------------
let g:vimfiler_edit_action          = 'right'
let g:vimfiler_as_default_explorer  = 1
let g:vimfiler_enable_auto_cd       = 1
let g:vimfiler_safe_mode_by_default = 0
" Like Textmate icons.
let g:vimfiler_tree_leaf_icon   = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon        = '-'
let g:vimfiler_marked_file_icon = '*'
nnoremap <silent> <Leader>fe :<C-u>VimFilerExplorer<CR>
nnoremap <silent> <Leader>fi :<C-u>VimFilerBufferDir<CR>

"-------------------------------------------------------------------------------
" Alignta
"-------------------------------------------------------------------------------
vnoremap <silent> == :Align =><CR>
vnoremap <silent> >> :Align >> =><CR>

"-------------------------------------------------------------------------------
" matchit.vim
"-------------------------------------------------------------------------------
let b:match_words =
 \  '<:>,' .
 \  '<\@<=!\[CDATA\[:]]>,'.
 \  '<\@<=!--:-->,'.
 \  '<\@<=?\k\+:?>,'.
 \  '<\@<=\([^ \t>/]\+\)\%(\s\+[^>]*\%([^/]>\|$\)\|>\|$\):<\@<=/\1>,'.
 \  '<\@<=\%([^ \t>/]\+\)\%(\s\+[^/>]*\|$\):/>'
let g:hl_matchit_enable_on_vim_startup = 1
let g:hl_matchit_hl_groupname = 'Title'
let g:hl_matchit_allow_ft = 'html\|vim\|ruby\|sh'

"-------------------------------------------------------------------------------
" wauto.vim
"-------------------------------------------------------------------------------
nmap <Leader>s  <Plug>(AutoWriteStart)
nmap <Leader>ss <Plug>(AutoWriteStop)
let g:auto_write = 1

"-------------------------------------------------------------------------------
" TweetVim
"-------------------------------------------------------------------------------
nnoremap <silent> <Leader>tw :<C-u>TweetVimUserStream vim emacs lang:ja<CR>

"矩形選択縦に連番をふる
nnoremap <silent> co :ContinuousNumber <C-a><CR>
vnoremap <silent> co :ContinuousNumber <C-a><CR>
command! -count -nargs=1 ContinuousNumber let snf=&nf|set nf-=octal|let cl = col('.')|for nc in range(1, <count>?<count>-line('.'):1)|exe 'normal! j' . nc . <q-args>|call cursor('.', cl)|endfor|unlet cl|unlet snf
