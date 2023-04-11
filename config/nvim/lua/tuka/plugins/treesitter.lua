return {
  'nvim-treesitter/nvim-treesitter',
  event = { "BufReadPost", "BufNewFile" },
  build = ':TSUpdate',
  dependencies = {
    'windwp/nvim-ts-autotag',
  },
  opts = {
    ensure_installed = {
      'go',
      'javascript',
      'typescript',
      'tsx',
      'json',
      'yaml',
      'toml',
      'lua',
      'terraform',
      'markdown',
      'markdown_inline',
    },
    sync_install = false,
    auto_install = true,
    highlight = {
      enable = true,
      disable = {},
    },
  },
  init = function ()
    require'nvim-treesitter.configs'.setup {
      autotag = {
        enable = true,
      },
      context_commentstring = {
        enable = true,
      },
    }

    local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
    parser_config.tsx.filetype_to_parsername = {
      'javascript',
      'typescript.tsx'
    }
  end,
}
