return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,       desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    },
  },
  {
    'tpope/vim-fugitive',
    lazy = true,
    dependencies = {
      'tpope/vim-rhubarb'
    },
    keys = {
      { '<leader>gb', '<Cmd>Git blame<CR>',   desc = 'Git Blame' },
      { '<leader>gs', '<Cmd>Gvdiffsplit<CR>', desc = 'Git Diff Split' },
    }
  },
  {
    "nvim-mini/mini.comment",
    version = "*",
    event = "VeryLazy",
    config = function(_, opts)
      require("mini.comment").setup(opts)
    end,
  },
  {
    'nvim-mini/mini.pairs',
    version = '*',
    event = "VeryLazy",
    config = function(_, opts)
      require("mini.pairs").setup(opts)
    end,
  },
  {
    "nvim-mini/mini.surround",
    version = "*",
    event = "VeryLazy",
    config = function(_, opts)
      require("mini.surround").setup(opts)
    end,
  },
  { "markdown-preview.nvim", enabled = false },
}
