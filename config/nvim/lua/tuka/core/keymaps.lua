-- set leader key to space
vim.g.mapleader = ' '

local keymap = vim.keymap

keymap.set('i', '<leader>jk', '<ESC>') -- Exit insert mode
keymap.set('n', '<leader>q', ':q<CR>') -- Quit
keymap.set('n', '<leader>nh', ':nohl<CR>') -- clear search highlights

-- Explorer
keymap.set('n', '<leader>e', '<Cmd>Telescope file_browser<CR>')

-- Telescope
keymap.set('n', '<leader>f', '<Cmd>Telescope find_files hidden=true<CR>')
keymap.set('n', '<leader>F', '<Cmd>Telescope find_files hidden=true no_ignore=true<CR>')
keymap.set('n', '<leader>g', '<Cmd>Telescope live_grep<CR>')
keymap.set('n', '<leader>b', '<Cmd>Telescope buffers<CR>')
keymap.set('n', '<leader>?', '<Cmd>Telescope help_tags<CR>')
keymap.set('n', '<leader>;', '<Cmd>Telescope resume<CR>')

-- Git
keymap.set('n', '<leader>h', '<Cmd>Git blame<CR>')
keymap.set('n', '<leader>d', '<Cmd>Gdiffsplit<CR>')
keymap.set('n', '<leader>o', "<Cmd>'<,'>GBrowse<CR>")

-- LspSaga
local opts = { noremap = true, silent = true }
keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
keymap.set('n', '<leader>l', '<Cmd>Lspsaga lsp_finder<CR>', opts)
keymap.set('n', '<leader>p', '<Cmd>Lspsaga peek_definition<CR>', opts)
keymap.set('n', '<leader>r', '<Cmd>Lspsaga rename<CR>', opts)

-- Editor
keymap.set('n', '<C-a>', 'gg<S-v>G') -- All selections
keymap.set('i', '<C-s>', '<C-o>:update<CR>', { silent = true }) -- Save (in insert mode)
keymap.set('n', '<C-s>', ':update<CR>', { silent = true }) -- Save
keymap.set('i', '<C-Space>', '<C-x><C-o>') -- Omnifunc
keymap.set('n', '+', '<C-a>') -- increment number
keymap.set('n', '-', '<C-x>') -- decrement number

-- Tab / Window
keymap.set('n', 'T', ':$tabnew<CR>', { silent = true }) -- Open new tab
keymap.set('n', '<', ':-tabnext<CR>', { silent = true }) -- Move tab next
keymap.set('n', '>', ':+tabnext<CR>', { silent = true }) -- Move tab prev

keymap.set('n', '_', ':sp<CR>', { silent = true }) -- Split window horizontally
keymap.set('n', '<bar>', ':vsp<CR>', { silent = true }) -- Split window vertically
keymap.set('n', 'wh', '<C-w>h') -- Move window left
keymap.set('n', 'w<left>', '<C-w>h')
keymap.set('n', 'wk', '<C-w>k') -- Move window up
keymap.set('n', 'w<up>', '<C-w>k')
keymap.set('n', 'wj', '<C-w>j') -- Move window down
keymap.set('n', 'w<down>', '<C-w>j')
keymap.set('n', 'wl', '<C-w>l') -- Move window right
keymap.set('n', 'w<right>', '<C-w>l')

-- Bufferline
keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
