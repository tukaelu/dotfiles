return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      bigfile = { enabled = true },
      dashboard = {
        enabled = true,
        sections = {
          { section = "header" },
          { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
          { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          { section = "startup" },
        },
      },
      explorer = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      lazygit = { enabled = true },
      notifier = {
        enabled = true,
        timeout = 3000,
      },
      picker = {
        enabled = true,
        sources = {
          explorer = {
            diagnostics = true,
            layout = {
              layout = {
                position = "right",
              },
            },
            win = {
              input = {
                keys = {
                  ["t"] = { "tab", mode = { "n", "i" } },
                },
              },
              list = {
                keys = {
                  ["t"] = "tab",
                },
              },
            },
          },
        },
      },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
      styles = {
        notification = {
          -- wo = { wrap = true } -- Wrap notifications
        }
      }
    },
    keys = {
      -- Top Pickers & Explorer
      { "<leader>e",       function() Snacks.explorer() end,                    desc = "File Explorer" },
      { "<leader><space>", function() Snacks.picker.files() end,                desc = "Find Files" },
      { "<leader>/",       function() Snacks.picker.grep() end,                 desc = "Grep" },
      { "<leader>,",       function() Snacks.picker.buffers() end,              desc = "Buffers" },
      { "<leader>:",       function() Snacks.picker.command_history() end,      desc = "Command History" },
      { "<leader>;",       function() Snacks.picker.resume() end,               desc = "Resume" },
      { "<leader>n",       function() Snacks.picker.notifications() end,        desc = "Notification History" },

      -- Snacks Picker
      { "<leader>sl",      function() Snacks.picker.lines() end,                desc = "Buffer Lines" },
      { "<leader>sw",      function() Snacks.picker.grep_word() end,            desc = "Visual selection or word", mode = { "n", "x" } },
      { '<leader>sh',      function() Snacks.picker.search_history() end,       desc = "Search History" },
      { "<leader>sk",      function() Snacks.picker.keymaps() end,              desc = "Keymaps" },
      { "<leader>si",      function() Snacks.picker.icons() end,                desc = "Icons" },
      { "<leader>sd",      function() Snacks.picker.diagnostics() end,          desc = "Diagnostics" },
      { "<leader>sD",      function() Snacks.picker.diagnostics_buffer() end,   desc = "Diagnostics" },

      -- Git
      { "<leader>gg",      function() Snacks.lazygit() end,                     desc = "Lazygit" },
      { "<leader>gl",      function() Snacks.lazygit.log() end,                 desc = "Lazygit Logs" },
      { "<leader>gd",      function() Snacks.picker.git_diff() end,             desc = "Git Diff (Hunks)" },
      { "<leader>gf",      function() Snacks.picker.git_log_file() end,         desc = "Git Log File" },
      { "<leader>go",      function() Snacks.gitbrowse() end,                   desc = "Git Browse",               mode = { "n", "v" } },

      -- LSP
      { "gd",              function() Snacks.picker.lsp_definitions() end,      desc = "Goto Definition" },
      { "gD",              function() Snacks.picker.lsp_declarations() end,     desc = "Goto Declaration" },
      { "gr",              function() Snacks.picker.lsp_references() end,       desc = "References",               nowait = true },
      { "gi",              function() Snacks.picker.lsp_implementations() end,  desc = "Goto Implementation" },
      { "gy",              function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },

      -- Other
      { "<leader>.",       function() Snacks.scratch() end,                     desc = "Toggle Scratch Buffer" },
      { "<leader>S",       function() Snacks.scratch.select() end,              desc = "Select Scratch Buffer" },
      { "<leader>n",       function() Snacks.notifier.show_history() end,       desc = "Notification History" },
      { "<leader>bd",      function() Snacks.bufdelete() end,                   desc = "Delete Buffer" },
      { "<leader>un",      function() Snacks.notifier.hide() end,               desc = "Dismiss All Notifications" },
      { "<c-/>",           function() Snacks.terminal() end,                    desc = "Toggle Terminal" },
      {
        "<leader>N",
        desc = "Neovim News",
        function()
          Snacks.win({
            file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[2],
            width = 1.6,
            height = 1.6,
            wo = {
              spell = false,
              wrap = false,
              signcolumn = "yes",
              statuscolumn = " ",
              conceallevel = 4,
            },
          })
        end,
      }
    },
    init = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        callback = function()
          -- Setup some globals for debugging (lazy-loaded)
          _G.dd = function(...)
            Snacks.debug.inspect(...)
          end
          _G.bt = function()
            Snacks.debug.backtrace()
          end

          -- Override print to use snacks for `:=` command
          if vim.fn.has("nvim1.11") == 1 then
            vim._print = function(_, ...)
              dd(...)
            end
          else
            vim.print = _G.dd
          end

          -- Create some toggle mappings
          Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
          Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
          Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
          Snacks.toggle.diagnostics():map("<leader>ud")
          Snacks.toggle.line_number():map("<leader>ul")
          Snacks.toggle.treesitter():map("<leader>uT")
          Snacks.toggle.inlay_hints():map("<leader>uh")
          Snacks.toggle.indent():map("<leader>ug")
          Snacks.toggle.dim():map("<leader>uD")
        end,
      })
    end,
  }
}
