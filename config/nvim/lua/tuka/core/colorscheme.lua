-- nord
vim.g.nord_disable_background = true

-- kanagawa
require('kanagawa').setup({
  compile = false,
  undercurl = true, -- enable undercurls
  commentStyle = { italic = true },
  functionStyle = {},
  keywordStyle = { italic = true },
  statementStyle = { bold = true },
  typeStyle = {},
  transparent = false,   -- do not set background color
  dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
  terminalColors = true, -- define vim.g.terminal_color_{0,17}
  colors = {
    palette = {},
    theme = {
      wave = {},
      lotus = {},
      dragon = {},
      all = {}
    }
  },
  overrides = function(colors)
    return {}
  end,
  theme = 'wave',
  background = {
    dark = 'wave',
    light = 'lotus'
  }
})

local status, _ = pcall(vim.cmd, 'colorscheme kanagawa')
if (not status) then
  print('colorscheme not found')
end
