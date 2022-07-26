autocmd!
scriptencoding utf-8

runtime ./plug.vim
runtime ./basics.vim
runtime ./keybinds.vim
runtime ./filetypes.vim
runtime ./term.vim

" true color
if exists("&termguicolors") && exists("&winblend")
  syntax enable
  set termguicolors
  set winblend=0
  set wildoptions=pum
  set pumblend=5
  set background=dark

  " Use NeoSolarized
  let g:neosolarized_termtrans=1
  colorscheme NeoSolarized
  " Use seoul256
  " colorscheme seoul256
endif

set exrc

" vim: set foldmethod=marker foldlevel=0:
