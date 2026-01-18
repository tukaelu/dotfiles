if vim.loader then
  vim.loader.enable()
end

pcall(require, "config.env")

require("config.keybinds")

require("config.lazy").load({
  profiling = {
    loader = false,
    require = true,
  },
})

require("config.options")

vim.cmd([[colorscheme kanagawa-dragon]])
