local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)

  -- Package manager
  use 'wbthomason/packer.nvim'

  -- Common utils
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'

  -- Themes
  use 'EdenEast/nightfox.nvim' -- Colorscheme
  use 'nvim-lualine/lualine.nvim' -- Status line
  use 'akinsho/nvim-bufferline.lua' -- Buffer line
  use 'kyazdani42/nvim-web-devicons' -- File icons

  -- Fuzzy finder
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'

  -- LSPs
  use 'neovim/nvim-lspconfig' -- LSP
  use 'glepnir/lspsaga.nvim' -- LSP UIs
  use 'williamboman/mason.nvim' -- LSP package manager
  use 'williamboman/mason-lspconfig.nvim'

  -- Completion
  use 'hrsh7th/nvim-cmp' -- Completion
  use 'hrsh7th/cmp-buffer' -- buffer completion
  use 'hrsh7th/cmp-path' -- path completion
  use 'hrsh7th/cmp-cmdline' -- cmdline completion
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
  use 'onsails/lspkind-nvim' -- vscode-like pictograms

  -- Snippets
  use 'L3MON4D3/LuaSnip'

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- Coding support
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag' -- autoclose & autorename html tag
  use({
    'iamcco/markdown-preview.nvim', -- markdown preview
    run = function() vim.fn['mkdp#util#install']() end,
  })
  use 'terrortylor/nvim-comment' -- toggle comments
  use 'akinsho/toggleterm.nvim' -- terminal
  use 'petertriho/nvim-scrollbar' -- extensible scrollbar
  use 'kevinhwang91/nvim-hlslens' -- support for search visivility

  -- Git support
  use 'lewis6991/gitsigns.nvim'
  use 'dinhhuy258/git.nvim' -- For git blame & browse

end)
