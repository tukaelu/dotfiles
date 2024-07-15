local M = {}

local function set_indent(tab_length, is_hard_tab)
  vim.bo.expandtab = not is_hard_tab
  vim.bo.shiftwidth = tab_length
  vim.bo.softtabstop = tab_length
  vim.bo.tabstop = tab_length
end

M.go = function()
  set_indent(4, true)
end

return setmetatable(M, {
  __index = function()
    return function()
      set_indent(2, false)
    end
  end,
})
