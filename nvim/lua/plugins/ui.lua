return {
  {
    'rebelot/kanagawa.nvim',
    event = "VeryLazy",
    opts = {
      compile = false,
      undercurl = true,
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      typeStyle = {},
      transparent = true,
      dimInactive = false,
      terminalColors = true,
      theme = 'dragon',
      background = {
        dark = 'dragon',
        light = 'lotus'
      },
    },
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    opts = {
      cmdline = {
        view = "cmdline_popup",
      },
      presets = {
        bottom_search = false,
        command_palette = true,
        long_message_to_split = true,
      },
    },
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
  {
    "nvim-mini/mini.statusline",
    event = "VeryLazy",
    config = function(_, opts)
      require("mini.statusline").setup(opts)
    end
  },
  {
    "nvim-mini/mini.icons",
    version = "*",
    event = "VeryLazy",
    opts = {
      style = "glyph",
    },
    config = function(_, opts)
      local MiniIcons = require("mini.icons")
      MiniIcons.setup(opts)
      MiniIcons.mock_nvim_web_devicons()
    end,
  },
  {
    "nvim-mini/mini.files",
    version = "*",
    event = "VeryLazy",
    config = function(_, opts)
      require("mini.files").setup(opts)
    end,
    keys = {
      { "<leader>mf", function() require("mini.files").open() end, desc = "Mini files" },
    },
  },
}
