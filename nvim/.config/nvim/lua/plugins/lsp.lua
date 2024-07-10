return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "gofumpt",
        "goimports",
        "golangci-lint",
        "golangci-lint-langserver",
        "gomodifytags",
        "gopls",
        "stylua",
        "shellcheck",
        "shfmt",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys + 1] = {
        "gd",
        function()
          require("telescope.builtin").lsp_definitions({ reuse_win = false })
        end,
        desc = "Goto definition",
        has = "definition",
      }
    end,
    opts = {
      inlay_hints = { enabled = false },
      servers = {
        gopls = {
          settings = {
            gopls = {
              gofumpt = true,
            },
          },
          flags = {
            debounce_text_changes = 150,
          },
        },
        golangci_lint_ls = {},
        lua_ls = {
          settings = {
            Lua = {
              runtime = { version = "LuaJIT" },
              workspace = {
                checkThirdParty = false,
                -- Tells lua_ls where to find all the Lua files that you have loaded
                -- for your neovim configuration.
                library = {
                  "${3rd}/luv/library",
                  unpack(vim.api.nvim_get_runtime_file("", true)),
                },
              },
            },
          },
        },
        yamlls = {
          settings = {
            yaml = {
              schemas = {
                ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
              },
            },
          },
        },
      },
    },
  },

  {
    "glepnir/lspsaga.nvim",
    lazy = true,
    keys = {
      { mode = "n", "K", "<Cmd>Lspsaga hover_doc<CR>" },
      { mode = "n", "<C-l>", "<Cmd>Lspsaga lsp_finder<CR>" },
      { mode = "n", "<C-d>", "<Cmd>Lspsaga peek_definition<CR>" },
      { mode = "n", "<C-_>", "<Cmd>Lspsaga rename<CR>" },
      { mode = "n", "<C-j>", "<Cmd>Lspsaga diagnostic_jump_next<CR>" },
    },
    opts = {
      ui = {
        border = "rounded",
        winblend = 20,
      },
      finder = {
        keys = {
          expand_or_jump = "<CR>",
        },
      },
      diagnostic = {
        insert_winblend = 0,
      },
    },
  },
}
