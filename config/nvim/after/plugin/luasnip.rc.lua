local status, ls = pcall(require, 'luasnip')
if (not status) then return end

require('luasnip.loaders.from_lua').load({ paths = "~/.config/nvim/snippets/" })

ls.config.set_config({
  history = true,
  updateevent = "TextChanged,TextChangedI",
  enable_autosnippets = true,
  ext_opts = {
    [require('luasnip.util.types').choiceNode] = {
      active = {
        virt_text = { { "●", "GruvboxOrange" } },
      },
    },
  },
})
