if !exists('g:loaded_nvim_treesitter')
  echom "Not loaded treesitter"
  finish
endif

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {}
  },
  indent = {
    enable = false,
    disable = {},
  },
  ensure_installed = {
    "tsx",
    "toml",
    "go",
    "json",
    "yaml",
    "html",
    "scss"
  },
}

local parser_config = require "nvim-treesitter.parsers".filetype_to_parsername
parser_config.typescriptreact = { "javascript", "typescript.tsx" }
parser_config.tsx = { "javascript", "typescript.tsx" }
EOF
