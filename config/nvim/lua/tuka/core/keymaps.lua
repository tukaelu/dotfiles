-- set leader key to space
vim.g.mapleader = ' '

local keymap = vim.keymap

keymap.set('i', '<leader>jk', '<ESC>') -- Exit insert mode
keymap.set('n', '<leader>q', ':q<CR>') -- Quit
keymap.set('n', '<leader>nh', ':nohl<CR>') -- clear search highlights

-- Editor
keymap.set('n', '<C-a>', 'gg<S-v>G') -- All selections
keymap.set('i', '<C-s>', '<C-o>:update<CR>', { silent = true }) -- Save (in insert mode)
keymap.set('n', '<C-s>', ':update<CR>', { silent = true }) -- Save

-- increment / decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Tab / Window
keymap.set('n', 'T', ':tabedit<CR>', { silent = true }) -- Open new tab
keymap.set('n', '<', 'gT', { silent = true }) -- Move tab next
keymap.set('n', '>', 'gt', { silent = true }) -- Move tab prev
keymap.set('n', 'wh', '<C-w>h') -- Move tab left
keymap.set('n', 'w<left>', '<C-w>h')
keymap.set('n', 'wk', '<C-w>k') -- Move tab up
keymap.set('n', 'w<up>', '<C-w>k')
keymap.set('n', 'wj', '<C-w>j') -- Move tab down
keymap.set('n', 'w<down>', '<C-w>j')
keymap.set('n', 'wl', '<C-w>l') -- Move tab right
keymap.set('n', 'w<right>', '<C-w>l')
keymap.set('n', '_', ':sp<CR>', { silent = true }) -- Split window horizontally
keymap.set('n', '<bar>', ':vsp<CR>', { silent = true }) -- Split window vertically
keymap.set('i', '<C-Space>', '<C-x><C-o>') -- Omnifunc

-- Bufferline
keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})

-- LspSaga
local opts = { noremap = true, silent = true }
keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
keymap.set('n', 'gl', '<Cmd>Lspsaga lsp_finder<CR>', opts)
keymap.set('n', 'gp', '<Cmd>Lspsaga peek_definition<CR>', opts)
keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)
keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)

-- Telescope
-- keymap.set('n', ';f', builtin.find_files({}))
-- keymap.set('n', ';g', builtin.live_grep())
-- keymap.set('n', ';b', builtin.buffers())
-- keymap.set('n', ';h', builtin.help_tags())
-- keymap.set('n', ';;', builtin.resume())
-- keymap.set('n', ';d', builtin.diagnostics())
-- keymap.set('n', ';e', telescope.extensions.file_browser.file_browser({}))

