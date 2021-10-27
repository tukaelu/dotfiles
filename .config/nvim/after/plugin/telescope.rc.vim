if !exists('g:loaded_telescope') | finish | endif

nnoremap <silent> sl <cmd>Telescope find_files<cr>
nnoremap <silent> sL <cmd>Telescope find_files hidden=true<cr>
nnoremap <silent> sr <cmd>Telescope live_grep<cr>
nnoremap <silent> sb <cmd>Telescope buffers<cr>
nnoremap <silent> s; <cmd>Telescope help_tags<cr>

lua << EOF
local actions = require('telescope.actions')
-- Global remapping
------------------------------
require('telescope').setup{
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  }
}
EOF
