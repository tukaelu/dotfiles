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
    "mvllow/modes.nvim",
    version = "*",
    event = { "CursorMoved", "CursorMovedI" },
    opts = function()
      local palette = require("kanagawa.colors").setup().palette
      return {
        colors = {
          copy = palette.autumnYellow,
          delete = palette.fujiWhite,
          insert = palette.crystalBlue,
          visual = palette.autumnGreen,
        },
        line_opacity = {
          copy = 0.4,
          delete = 0.4,
          insert = 0.4,
          visual = 0.4,
        },
      }
    end,
  },
  {
    "WilliamHsieh/overlook.nvim",
    opts = {},
    init = function()
      vim.api.nvim_create_autocmd("BufWinEnter", {
        group = vim.api.nvim_create_augroup("overlook_enter_mapping", { clear = true }),
        pattern = "*",
        callback = function()
          vim.schedule(function()
            if vim.w.is_overlook_popup then
              -- open in orig window on enter
              vim.keymap.set("n", "<CR>", function()
                require("overlook.api").open_in_original_window()
              end, { buffer = true, desc = "Overlook: Open in original window" })

              -- open in vsplit on ctrl+enter
              for _, lhs in ipairs({ "<C-CR>", ";" }) do
                vim.keymap.set("n", lhs, function()
                  require("overlook.api").open_in_vsplit()
                end, { buffer = true, desc = "Overlook: Open in vertical split" })
              end
            end
          end)
        end,
      })
    end,
    keys = {
      { "<leader>pu", function() require("overlook.api").restore_popup() end,           desc = "Restore last popup" },
      { "<leader>pU", function() require("overlook.api").restore_all_popups() end,      desc = "Restore all popups" },
      { "<leader>pc", function() require("overlook.api").close_all() end,               desc = "Close all popups" },
      { "<leader>ps", function() require("overlook.api").open_in_split() end,           desc = "Open popup in split" },
      { "<leader>pv", function() require("overlook.api").open_in_vsplit() end,          desc = "Open popup in vsplit" },
      { "<leader>pt", function() require("overlook.api").open_in_tab() end,             desc = "Open popup in tab" },
      { "<leader>po", function() require("overlook.api").open_in_original_window() end, desc = "Open popup in current window" },
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
