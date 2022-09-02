local status, bufferline = pcall(require, 'bufferline')
if (not status) then return end

bufferline.setup {
  options = {
    mode = 'tabs',
    separator_style = 'slant',
    always_show_bufferline = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true
  },
  highlights = {
    separator = {
      fg = '#2E3440',
      bg = '#2E3440',
    },
    separator_selected = {
      fg = '#2E3440',
      bg = '#4C566A',
    },
    background = {
      fg = '#81A1C1',
      bg = '#2E3440',
    },
    buffer_selected = {
      fg = '#ECEFF4',
      bg = '#4C566A',
      italic = true
    },
    modified = {
      bg = '#2E3440',
    },
    modified_selected = {
      bg = '#4C566A',
    },
  },
}

vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
