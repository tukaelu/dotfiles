local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- set leader key to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

keymap('i', 'jk', '<ESC>', opts) -- Exit insert mode
keymap('n', '<leader>q', ':q<CR>', opts) -- Quit
keymap('n', '<leader>nh', ':nohl<CR>', opts) -- clear search highlights

-- Explorer
keymap('n', '<leader>e', '<Cmd>Telescope file_browser<CR>', opts)

-- Telescope
keymap('n', '<leader>f', '<Cmd>Telescope find_files hidden=true<CR>', opts)
keymap('n', '<leader>F', '<Cmd>Telescope find_files hidden=true no_ignore=true<CR>', opts)
keymap('n', '<leader>g', '<Cmd>Telescope live_grep<CR>', opts)
keymap('n', '<leader>B', '<Cmd>Telescope buffers<CR>', opts)
keymap('n', '<leader>?', '<Cmd>Telescope help_tags<CR>', opts)
keymap('n', '<leader>;', '<Cmd>Telescope resume<CR>', opts)

-- Git
keymap('n', '<leader>b', '<Cmd>Git blame<CR>', opts)
keymap('n', '<leader>d', '<Cmd>Gvdiffsplit<CR>', opts)
keymap('n', '<leader>o', "<Cmd>'<,'>GBrowse<CR>", opts)

-- LspSaga
keymap('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
keymap('n', '<C-l>', '<Cmd>Lspsaga lsp_finder<CR>', opts)
keymap('n', '<C-d>', '<Cmd>Lspsaga peek_definition<CR>', opts)
keymap('n', '<C-_>', '<Cmd>Lspsaga rename<CR>', opts)
keymap('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)

-- Editor
keymap('n', '<C-a>', 'gg<S-v>G', opts) -- All selections
keymap('i', '<C-s>', '<C-o>:update<CR>', opts) -- Save (in insert mode)
keymap('n', '<C-s>', ':update<CR>', opts) -- Save
keymap('i', '<C-Space>', '<C-x><C-o>', opts) -- Omnifunc
keymap('n', '+', '<C-a>', opts) -- increment number
keymap('n', '-', '<C-x>', opts) -- decrement number
keymap('v', '>', '>gv', opts) -- stay in visual indent
keymap('v', '<', '<gv', opts) -- stay in visual indent

-- Tab / Window
keymap('n', 'T', ':$tabnew<CR>', opts) -- Open new tab
keymap('n', '<', ':-tabnext<CR>', opts) -- Move tab next
keymap('n', '>', ':+tabnext<CR>', opts) -- Move tab prev
keymap('n', '_', ':sp<CR>', opts) -- Split window horizontally
keymap('n', '<bar>', ':vsp<CR>', opts) -- Split window vertically
keymap('n', '<C-Up>', ':resize -2<CR>', opts) -- Window resize
keymap('n', '<C-Down>', ':resize +2<CR>', opts) -- Window resize
keymap('n', '<C-Right>', ':vertical resize -2<CR>', opts) -- Window resize
keymap('n', '<C-Left>', ':vertical resize +2<CR>', opts) -- Window resize

-- Bufferline
keymap('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', opts)
keymap('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', opts)
