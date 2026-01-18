vim.g.mapleader = ' '

local function bind(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.noremap = opts.noremap ~= false
  opts.silent = opts.silent ~= false
  vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

bind('i', '<C-Space>', '<C-x><C-o>', { desc = 'Omnifunc' })
bind('i', 'jk', '<ESC>', { desc = 'Exit insert mode' })
bind('i', '<C-s>', '<C-o>:update<CR>', { desc = 'Save (in insert mode)' })
bind('n', '<C-s>', '<Cmd>update<CR>', { desc = 'Save' })
bind('n', '<leader>q', '<Cmd>q<CR>', { desc = 'Quit' })
bind('n', '<leader>Q', '<Cmd>qa<CR>', { desc = 'Quit all' })
bind('n', '<leader>t', '<Cmd>$tabnew<CR>', { desc = 'Open new tab' })
bind('n', '>', '<Cmd>+tabnext<CR>', { desc = 'Move tab next' })
bind('n', '<', '<Cmd>-tabnext<CR>', { desc = 'Move tab prev' })
bind('n', '<C-a>', 'gg<S-v>G', { desc = 'Select all' })
bind('n', '<leader>sn', '<Cmd>nohl<CR>', { desc = 'Clear highlights' })
bind('n', '_', '<Cmd>sp<CR>', { desc = 'Split window horizontally' })
bind('n', '<bar>', '<Cmd>vsp<CR>', { desc = 'Split window vertically' })
bind('n', '<C-Up>', '<Cmd>resize -2<CR>', { desc = 'Resize window' })
bind('n', '<C-Down>', '<Cmd>resize +2<CR>', { desc = 'Resize window' })
bind('n', '<C-Right>', '<Cmd>vertical resize -2<CR>', { desc = 'Resize window' })
bind('n', '<C-Left>', '<Cmd>vertical resize +2<CR>', { desc = 'Resize window' })
bind('n', '+', '<C-a>', { desc = 'Increment number' })
bind('n', '-', '<C-x>', { desc = 'Decrement number' })
bind('v', '>', '>gv', { desc = 'Stay in visual indent' })
bind('v', '<', '<gv', { desc = 'Stay in visual indent' })
bind('n', '<leader>l', '<Cmd>Lazy<CR>', { desc = 'Lazy' })
bind('n', '<leader>L', '<Cmd>Lazy profile<CR>', { desc = 'Lazy profile' })
