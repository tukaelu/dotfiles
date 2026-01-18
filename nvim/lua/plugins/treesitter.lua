return {
  'nvim-treesitter/nvim-treesitter',
  event = { "BufReadPost", "BufNewFile" },
  build = ':TSUpdate',
  opts = {
    ensure_installed = {
      'go',
      'javascript',
      'typescript',
      'tsx',
      'vue',
      'json',
      'yaml',
      'toml',
      'lua',
      'sql',
      'ruby',
      'markdown',
      'markdown_inline',
    },
  },
}
