-- Configuration UI
-- * Startup
-- * Bufferline
-- * Statusline
-- * Scrollbar
return {
  -- -- Startup greeter
  -- {
  --   'goolord/alpha-nvim',
  --   dependencies= {
  --     'nvim-tree/nvim-web-devicons',
  --   },
  --   config = function()
  --     require('alpha').setup(require('alpha.themes.startify').config)
  --   end
  -- },

  -- Bufferline
  {
    'akinsho/bufferline.nvim',
    event = "VeryLazy",
    dependencies= {
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      options = {
        mode = 'tabs',
        separator_style = 'thin',
        always_show_bufferline = true,
        show_buffer_icons = true,
        show_buffer_close_icons = false,
        show_close_icon = false,
        color_icons = true,
      },
      highlights = {
        separator = {
          fg = '#2E3440',
          bg = '#2E3440',
        },
        separator_selected = {
          fg = '#2E3440',
          bg = '#4C566A',
        },
        background = {
          fg = '#81A1C1',
          bg = '#2E3440',
        },
        buffer_selected = {
          fg = '#ECEFF4',
          bg = '#4C566A',
          italic = true
        },
        modified = {
          bg = '#2E3440',
        },
        modified_selected = {
          bg = '#4C566A',
        },
      },
    }
  },

  -- Statusline
  {
    'nvim-lualine/lualine.nvim',
    event = "VeryLazy",
    dependencies = {
      'tpope/vim-fugitive'
    },
    opts = {
      options = {
        icons_enabled = true,
        theme = 'gruvbox',
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        disabled_filetypes = {}
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = { {
          'filename',
          file_status = true, -- displays file status (readonly status, modified status)
          path = 0 -- 0 = just filename, 1 = relative path, 2 = absolute path
        } },
        lualine_x = {
          {
            'diagnostics',
            sources = { 'nvim_diagnostic' },
            symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' }
          },
          'encoding',
          'filetype'
        },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { {
          'filename',
          file_status = true, -- displays file status (readonly status, modified status)
          path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
        } },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      extensions = { 'fugitive' }
    }
  },

  -- Scrollbar
  {
    'petertriho/nvim-scrollbar',
    event = "VeryLazy",
    init = function ()
      require('scrollbar.handlers.search').setup()
    end
  },
}
