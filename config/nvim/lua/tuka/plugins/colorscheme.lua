return {
  {
    'ellisonleao/gruvbox.nvim',
    event = "VeryLazy",
    opts = {
      overrides = {
        CursorLine = { bg = '#7c6f64' }, -- bg4
      },
      transparent_mode = true,
    },
  },
  {
    'rebelot/kanagawa.nvim',
    event = "VeryLazy",
    opts = {
      compile = false,
      undercurl = true, -- enable undercurls
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      typeStyle = {},
      transparent = true,   -- do not set background color
      dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
      terminalColors = true, -- define vim.g.terminal_color_{0,17}
      theme = 'wave',
      background = {
        dark = 'wave',
        light = 'lotus'
      }
    },
  },
}
