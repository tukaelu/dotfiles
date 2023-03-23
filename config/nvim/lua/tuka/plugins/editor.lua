local utils = require('tuka.utils')

return {
  -- file explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    dependencies = {
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    keys = {
      {
        "<leader>fe",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = utils.get_root() })
        end,
        desc = "Explorer NeoTree (root dir)",
      },
      {
        "<leader>fE",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
        end,
        desc = "Explorer NeoTree (cwd)",
      },
      { '<leader>fg', '<Cmd>Neotree float git_status<CR>', desc = 'Float Explorer (git status)' },
    },
    deactivate = function()
      vim.cmd([[Neotree close]])
    end,
    init = function()
      vim.g.neo_tree_remove_legacy_commands = 1
      if vim.fn.argc() == 1 then
        local stat = vim.loop.fs_stat(vim.fn.argv(0))
        if stat and stat.type == "directory" then
          require("neo-tree")
        end
      end
    end,
    opts = {
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = true,
      },
      source_selector = {
        winbar = true,
        statusline = true,
      },
      window = {
        mappings = {
          ["<space>"] = "none",
        },
      },
      default_component_configs = {
        indent = {
          with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
      },
    },
  },

  -- fuzzy finder
  {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-lua/popup.nvim',
      'nvim-telescope/telescope-file-browser.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    keys = {
      { '<leader>e', '<Cmd>Telescope file_browser<CR>', desc = 'File browser' },
      { '<leader>/', utils.telescope('live_grep'), desc = 'Find in Files (Grep)' },
      { '<leader>:', '<Cmd>Telescope command_history<CR>', desc = 'Command History' },
      { '<leader>,', '<Cmd>Telescope buffers show_all_buffers=true<CR>', desc = 'Switch Buffer' },
      { '<leader>\'', utils.telescope('files', { hidden = true, cwd = false }), desc = 'Find Files' },
      { '<leader>;', '<Cmd>Telescope resume<CR>', desc = 'Resume' },
      -- find
      { '<leader>fb', '<Cmd>Telescope buffers<CR>', desc = 'Buffers' },
      { '<leader>ff', utils.telescope('files', { hidden = true }), desc = 'Find Files (root dir)' },
      { '<leader>fF', utils.telescope('files', { hidden = true, cwd = false }), desc = 'Find Files (cwd)' },
      { '<leader>fr', '<Cmd>Telescope oldfiles<CR>', desc = 'Recent' },
      -- git
      { '<leader>gc', '<Cmd>Telescope git_commits<CR>', desc = 'commits' },
      { '<leader>gs', '<Cmd>Telescope git_status<CR>', desc = 'status' },
      -- search
      { '<leader>sa', '<Cmd>Telescope autocommands<CR>', desc = 'Auto Commands' },
      { '<leader>sb', '<Cmd>Telescope current_buffer_fuzzy_find<CR>', desc = 'Buffer' },
      { '<leader>sc', '<Cmd>Telescope command_history<CR>', desc = 'Command History' },
      { '<leader>sC', '<Cmd>Telescope commands<CR>', desc = 'Commands' },
      { '<leader>sd', '<Cmd>Telescope diagnostics<CR>', desc = 'Diagnostics' },
      { '<leader>sg', utils.telescope('live_grep'), desc = 'Grep (root dir)' },
      { '<leader>sG', utils.telescope('live_grep', { cwd = false }), desc = 'Grep (cwd)' },
      { '<leader>sh', '<Cmd>Telescope help_tags<CR>', desc = 'Help Pages' },
      { '<leader>sH', '<Cmd>Telescope highlights<CR>', desc = 'Search Highlight Groups' },
      { '<leader>sk', '<Cmd>Telescope keymaps<CR>', desc = 'Key Maps' },
      { '<leader>sM', '<Cmd>Telescope man_pages<CR>', desc = 'Man Pages' },
      { '<leader>sm', '<Cmd>Telescope marks<CR>', desc = 'Jump to Mark' },
      { '<leader>so', '<Cmd>Telescope vim_options<CR>', desc = 'Options' },
      { '<leader>sR', '<Cmd>Telescope resume<CR>', desc = 'Resume' },
      { '<leader>sw', '<Cmd>Telescope grep_string<CR>', desc = 'Word (root dir)' },
      { '<leader>sW', '<Cmd>Telescope grep_string cwd=false<CR>', desc = 'Word (cwd)' },
      -- UI
      { '<leader>uc', '<Cmd>Telescope colorscheme<CR>', desc = 'Colorscheme with preview' },
    },
    config = function ()

      local function telescope_buffer_dir()
        return vim.fn.expand('%:p:h')
      end

      local telescope = require('telescope')
      local actions = require('telescope.actions')
      local fb_actions = require('telescope').extensions.file_browser.actions

      telescope.setup {
        defaults = {
          mappings = {
            n = {
              ['q'] = actions.close
            },
          },
          file_ignore_patterns = {
            '.git/',
            'node_modules/',
          }
        },
        extensions = {
          file_browser = {
            theme = 'dropdown',
            path = '%:p:h',
            cwd = telescope_buffer_dir(),
            respect_gitignore = false,
            hidden = true,
            grouped = true,
            previewer = false,
            initial_mode = 'normal',
            layout_config = { height = 35 },
            hijack_netrw = true,
            mappings = {
              ['i'] = {
                ['<C-w>'] = function() vim.cmd('normal vbd') end,
              },
              ['n'] = {
                ['N'] = fb_actions.create,
                ['h'] = fb_actions.goto_parent_dir,
                ['/'] = function()
                  vim.cmd('startinsert')
                end
              },
            },
          },
          fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
          },
        },
        pickers = {
          colorscheme = { enable_preview = true },
        },
      }
      telescope.load_extension('file_browser')
      telescope.load_extension('fzf')
    end,
  },

  -- search highlights
  { 'kevinhwang91/nvim-hlslens', lazy = true },

  -- search/replace in multiple files
  {
    'windwp/nvim-spectre',
    keys = {
      { '<leader>sr', function() require('spectre').open() end, desc = 'Replace in files (Spectre)' },
    },
  },

  -- easily jump to any location and enhanced f/t motions for Leap
  {
    'ggandor/flit.nvim',
    keys = function()
      local ret = {}
      for _, key in ipairs({ 'f', 'F', 't', 'T' }) do
        ret[#ret + 1] = { key, mode = { 'n', 'x', 'o' }, desc = key }
      end
      return ret
    end,
    opts = { labeled_modes = 'nx' },
  },
  {
    'ggandor/leap.nvim',
    keys = {
      { 's', mode = { 'n', 'x', 'o' }, desc = 'Leap forward to' },
      { 'S', mode = { 'n', 'x', 'o' }, desc = 'Leap backward to' },
      { 'gs', mode = { 'n', 'x', 'o' }, desc = 'Leap from windows' },
    },
    config = function(_, opts)
      local leap = require('leap')
      for k, v in pairs(opts) do
        leap.opts[k] = v
      end
      leap.add_default_mappings(true)
      vim.keymap.del({ 'x', 'o' }, 'x')
      vim.keymap.del({ 'x', 'o' }, 'X')
    end,
  },

  -- which-key
  {
    'folke/which-key.nvim',
    opts = {
      plugins = { spelling = true },
    },
    config = function(_, opts)
      vim.o.timeout = true
      vim.o.timeoutlen = 200
      local wk = require('which-key')
      wk.setup(opts)
      local keymaps = {
        mode = { 'n', 'v' },
        ['g'] = { name = '+goto' },
        [']'] = { name = '+next' },
        ['['] = { name = '+prev' },
        ['<leader><tab>'] = { name = '+tabs' },
        ['<leader>b'] = { name = '+buffer' },
        ['<leader>c'] = { name = '+code' },
        ['<leader>f'] = { name = '+file/find' },
        ['<leader>g'] = { name = '+git' },
        ['<leader>gh'] = { name = '+hunks' },
        -- ['<leader>q'] = { name = '+quit/session' },
        ['<leader>s'] = { name = '+search' },
        ['<leader>u'] = { name = '+ui' },
        -- ['<leader>w'] = { name = '+windows' },
        -- ['<leader>x'] = { name = '+diagnostics/quickfix' },
      }
      wk.register(keymaps)
    end,
  },
}
