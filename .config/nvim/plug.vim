" ============================================================================
"  Plugin definition
" ============================================================================

if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

" Theme
Plug 'overcache/NeoSolarized'
Plug 'junegunn/seoul256.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Fuzzy Finder
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'

" File Explorer
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'kristijanhusak/defx-git'
Plug 'kristijanhusak/defx-icons'

" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" LSP Support
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
Plug 'folke/lsp-colors.nvim'
Plug 'williamboman/nvim-lsp-installer'
Plug 'nvim-lua/completion-nvim'

" Coding Support
"Plug 'windwp/nvim-autopairs'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

" Window Selector
Plug 't9md/vim-choosewin'

call plug#end()
