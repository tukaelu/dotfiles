-- auto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, 'packer')
if (not status) then return end

packer.startup(function(use)
  -- Package manager
  use 'wbthomason/packer.nvim'

  -- Common utils
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'

  -- Themes
  use 'shaunsingh/nord.nvim'         -- Colorscheme
  use 'rebelot/kanagawa.nvim'        -- Colorscheme
  use 'nvim-lualine/lualine.nvim'    -- Status line
  use 'akinsho/nvim-bufferline.lua'  -- Buffer line
  use 'kyazdani42/nvim-web-devicons' -- File icons

  -- Fuzzy finder
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- LSPs
  use 'neovim/nvim-lspconfig'   -- LSP
  use 'glepnir/lspsaga.nvim'    -- LSP UIs
  use 'williamboman/mason.nvim' -- LSP package manager
  use 'williamboman/mason-lspconfig.nvim'
  use 'jose-elias-alvarez/null-ls.nvim'

  -- Completion
  use 'hrsh7th/nvim-cmp'         -- Completion
  use 'hrsh7th/cmp-buffer'       -- buffer completion
  use 'hrsh7th/cmp-path'         -- path completion
  use 'hrsh7th/cmp-cmdline'      -- cmdline completion
  use 'hrsh7th/cmp-nvim-lsp'     -- nvim-cmp source for neovim's built-in LSP
  use 'onsails/lspkind-nvim'     -- vscode-like pictograms
  use 'saadparwaiz1/cmp_luasnip' -- luasnip completion

  -- Snippets
  use 'L3MON4D3/LuaSnip'

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- Coding support
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'      -- autoclose & autorename html tag
  use({
    'iamcco/markdown-preview.nvim', -- markdown preview
    run = function() vim.fn['mkdp#util#install']() end,
  })
  use 'terrortylor/nvim-comment'    -- toggle comments
  use 'petertriho/nvim-scrollbar'   -- extensible scrollbar
  use 'kevinhwang91/nvim-hlslens'   -- support for search visivility
  use 'norcalli/nvim-colorizer.lua' -- color highlighter
  use 'justinmk/vim-sneak'          -- jump location

  -- Git support
  use 'lewis6991/gitsigns.nvim'
  use 'tpope/vim-fugitive'        -- For git blame & browse
  use 'tpope/vim-rhubarb'
  use 'akinsho/git-conflict.nvim' -- support for conflict resolution

  -- Startup greeter
  use({
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require 'alpha'.setup(require 'alpha.themes.startify'.config)
    end
  })

  if packer_bootstrap then
    require('packer').sync()
  end
end)
