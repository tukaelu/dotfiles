
local colors = require('nightfox.palette.nightfox')

require('scrollbar').setup({
  marks = {
    Search = { color = colors.palette.orange.base },
    Error = { color = colors.palette.red.base },
    Warn = { color = colors.palette.yellow.base },
    Info = { color = colors.palette.blue.base },
    Hint = { color = colors.palette.green.base },
    Misc = { color = colors.palette.pink.base }
  }
})

require('scrollbar.handlers.search').setup()
