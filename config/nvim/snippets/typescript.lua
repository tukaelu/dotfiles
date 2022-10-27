local ls = require('luasnip')
local s = ls.s
local i = ls.i
local t = ls.t

local snippets = {
  s({ trig = "imp", name = "import" }, {
    t "import ", i(2), t " from '", i(1), t "'",
    i(0)
  }),
  s({ trig = "imp", name = "import(named)" }, {
    t "import {", i(2), t "} from '", i(1), t "'",
    i(0)
  })
}

return snippets
