local keymap = vim.keymap

-- Editor
keymap.set('n', '<C-a>', 'gg<S-v>G') -- All selections
keymap.set('i', '<C-s>', '<C-o>:update<CR>', { silent = true }) -- Save (in insert mode)
keymap.set('n', '<C-s>', ':update<CR>', { silent = true }) -- Save
keymap.set('n', ';q', ':q<CR>') -- Quit

-- Extra
keymap.set('n', 'x', '"_x') -- Do not yank with 'x'
keymap.set('n', 's', '"_s') -- Do not yank with 's'
keymap.set('n', ';r', ':source $MYVIMRC<CR>') -- Reload vim configuration
keymap.set('n', '+', '<C-a>') -- Increment number
keymap.set('n', '-', '<C-x>') -- Decrement number

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

-- Telescope
-- keymap.set('n', ';f', builtin.find_files)
-- keymap.set('n', ';s', builtin.live_grep)
-- keymap.set('n', ';b', builtin.buffers)
-- keymap.set('n', ';t', builtin.help_tags)
-- keymap.set('n', ';;', builtin.resume)
-- keymap.set('n', ';e', builtin.diagnostics)
-- keymap.set('n', 'sf', telescope.extensions.file_browser.file_browser)

-- LSP Saga
-- keymap.set('n', '<C-j>', Lspsaga diagnostic_jump_next)
-- keymap.set('n', 'K', Lspsaga hover_doc)
-- keymap.set('n', 'gd', Lspsaga lsp_finder)
-- keymap.set('n', 'gp', Lspsaga preview_definition)
-- keymap.set('n', 'gr', Lspsaga rename)
-- keymap.set('i', '<C-k>', Lspsaga signature_help)

-- Git
-- keymap.set('n', 'gb', git blame)
-- keymap.set('n', 'go', git browse)
