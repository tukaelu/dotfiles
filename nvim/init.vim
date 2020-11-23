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

source ~/.config/nvim/config/basics.vim
source ~/.config/nvim/config/keybinds.vim

