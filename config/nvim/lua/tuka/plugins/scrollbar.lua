local colors = require('nord.named_colors')

require('scrollbar').setup({
  marks = {
    Search = { color = colors.orange },
    Error = { color = colors.red },
    Warn = { color = colors.yellow },
    Info = { color = colors.blue },
    Hint = { color = colors.green },
    Misc = { color = colors.purple }
  }
})

require('scrollbar.handlers.search').setup()
