" vim: set foldmethod=marker foldlevel=0:
"   ___  ________   ___  _________    ___      ___ ___  _____ ______
"  |\  \|\   ___  \|\  \|\___   ___\ |\  \    /  /|\  \|\   _ \  _   \
"  \ \  \ \  \\ \  \ \  \|___ \  \_| \ \  \  /  / | \  \ \  \\\__\ \  \
"   \ \  \ \  \\ \  \ \  \   \ \  \   \ \  \/  / / \ \  \ \  \\|__| \  \
"    \ \  \ \  \\ \  \ \  \   \ \  \ __\ \    / /   \ \  \ \  \    \ \  \
"     \ \__\ \__\\ \__\ \__\   \ \__\\__\ \__/ /     \ \__\ \__\    \ \__\
"      \|__|\|__| \|__|\|__|    \|__\|__|\|__|/       \|__|\|__|     \|__|
"

let s:darwin = has('mac')

if &compatible
  set nocompatible
endif

let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let g:nvim_dir = expand('~/.config/nvim')

  let s:plugins = g:nvim_dir . '/dein.toml'
  let s:plugins_lazy = g:nvim_dir . '/dein_lazy.toml'

  call dein#load_toml(s:plugins, {'lazy': 0})
  call dein#load_toml(s:plugins_lazy, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif


" ============================================================================
"  basic settings {{{
" ============================================================================

let mapleader = ','
let maplocalleader = ','

augroup vimr1
    autocmd!
augroup END

set encoding=utf-8
scriptencoding utf-8

set number                                   " 行数を表示
set cursorline                               " カーソル行の背景色を変える
set showcmd                                  " コマンドをステータス行に表示
set noshowmode                               " 現在のモードを表示
set laststatus=2                             " ステータス行を常時表示
set cmdheight=2                              " メッセージ表示欄を2行確保
set showmatch                                " 対応する括弧を表示
set list                                     " 不可視文字を表示
set listchars=tab:›\ ,eol:↲,extends:»,precedes:«,nbsp:¯,trail:␣
set backspace=indent,eol,start               " バックスペースでなんでも消せるように
                                             " `%` で移動するペアを全角文字にも拡張する
set matchpairs+=（:）,「:」,【:】,［:］,｛:｝,＜:＞
set wrap                                     " ウィンドウの幅が足りないときは折り返す
set breakindent                              " 折り返し時にインデントする
set showbreak=››                             " 折り返したときに行頭にマークを表示する
set whichwrap=b,s,h,l,<,>,[,]                " カーソルを行頭、行末で止まらないようにする
set scrolloff=3                              " 上下の画面の端にカーソルを寄せない。
set sidescrolloff=5                          " 左右の画面の端にカーソルを寄せない。
set confirm                                  " 保存していないファイルを閉じる際に確認を促す
set autoread                                 " 他で書き換えられたら自動で読み直す
set nobackup                                 " バックアップ取らない
set noswapfile                               " スワップファイル作らない
set hidden                                   " 編集中でも他のファイルを開けるようにする
set modelines=0                              " モードラインは無効
set hlsearch                                 " 検索結果をハイライトする
set incsearch                                " インクリメンタルサーチを有効にする
set ignorecase                               " 大文字小文字を区別しない
set wrapscan                                 " 催行日まで検索を終えたら先頭に戻る
set autoindent                               " インデントを自動で揃える
set smartindent                              " 前の行末に応じてインデントを調整する
set tabstop=4                                " 表示タブ幅=4
set shiftwidth=4                             " 自動インデントタブ幅=4
set expandtab                                " タブではなくスペースでインデントする
set textwidth=0                              " 一行に長い文章を書いていても自動折り返しをしない
set formatoptions=lmoq                       " テキスト整形オプション，マルチバイト系を追加
set visualbell t_vb=                         " ビープをならさない
set browsedir=buffer                         " Exploreの初期ディレクトリ
set viminfo='50,<1000,s100,\"50              " viminfoファイルの設定
set clipboard=unnamed,unnamedplus            " クリップボード
set mouse=a                                  " すべてのモードでマウス操作を有効にする
set guioptions+=a                            " ビジュアルモードの選択行をクリップボードに保存する
set ttyfast                                  " ターミナル接続を高速化
set t_Co=256                                 " 256色表示
set lazyredraw                               " 画面描画をできるだけ遅らせる
                                             " エンコーディング
set fileencodings=utf-8,euc-jp,sjis,iso-2022-jp
set fileformat=unix                          " 改行コード指定
set fileformats=unix,dos,mac                 " 改行コード自動認識
set shell=sh                                 " Shell実行時はshを強制
set wildmenu
set wildmode=list:longest
syntax on                                    " 構文に応じたカラー表示にする
                                             " カーソル行をハイライトする
"highlight CursorLine cterm=NONE ctermfg=blue ctermbg=black

" }}}
" ============================================================================
" key mappings {{{
" ============================================================================

" Save
inoremap <C-s> <C-O>:update<cr>
nnoremap <C-s> :update<cr>

" Windows split
nnoremap _     <ESC>:sp<CR>
nnoremap <bar> <ESC>:vsp<CR>

" Tab control
nnoremap T <ESC>:tabnew<CR>
nnoremap < gT
nnoremap > gt
nnoremap <space>q <ESC>:q<CR>

" }}}
