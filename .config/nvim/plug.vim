" ============================================================================
"  Plugin definition
" ============================================================================

if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

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
Plug 'nvim-lua/completion-nvim'
Plug 'folke/lsp-colors.nvim'

" Coding Support
Plug 'windwp/nvim-autopairs'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'editorconfig/editorconfig-vim'
Plug 't9md/vim-choosewin'
Plug 'folke/trouble.nvim'

" Theme
Plug 'hoob3rt/lualine.nvim'
Plug 'overcache/NeoSolarized'
Plug 'junegunn/seoul256.vim'
Plug 'kyazdani42/nvim-web-devicons'

call plug#end()
