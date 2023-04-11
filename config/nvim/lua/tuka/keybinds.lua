vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local function bind(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.noremap = opts.noremap ~= false
  opts.silent = opts.silent ~= false
  vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

bind('i', '<C-Space>', '<C-x><C-o>')                  -- Omnifunc
bind('i', 'jk', '<ESC>', { desc = 'Exit insert mode' })
bind('i', '<C-s>', '<C-o>:update<CR>')                -- Save (in insert mode)
bind('n', '<C-s>', '<Cmd>update<CR>')                 -- Save
bind('n', '<leader>q', '<Cmd>q<CR>')                  -- Quit
bind('n', '<leader>Q', '<Cmd>qa<CR>')                 -- Quit all
bind('n', '<leader>t', '<Cmd>$tabnew<CR>', { desc = 'Open new tab' })
bind('n', '>', '<Cmd>+tabnext<CR>')                   -- Move tab next
bind('n', '<', '<Cmd>-tabnext<CR>')                   -- Move tab prev
bind('n', '<C-a>', 'gg<S-v>G')                        -- All selections
bind('n', '<leader>sn', '<Cmd>nohl<CR>', { desc = 'Clear search highlights' })
bind('n', '_', '<Cmd>sp<CR>')                         -- Split window horizontally
bind('n', '<bar>', '<Cmd>vsp<CR>')                    -- Split window vertically
bind('n', '<C-Up>', '<Cmd>resize -2<CR>')             -- Resize window
bind('n', '<C-Down>', '<Cmd>resize +2<CR>')           -- Resize window
bind('n', '<C-Right>', '<Cmd>vertical resize -2<CR>') -- Resize window
bind('n', '<C-Left>', '<Cmd>vertical resize +2<CR>')  -- Resize window
bind('n', '+', '<C-a>')                               -- Increment number
bind('n', '-', '<C-x>')                               -- Decrement number
bind('v', '>', '>gv')                                 -- Stay in visual indent
bind('v', '<', '<gv')                                 -- Stay in visual indent
bind('n', '<leader>l', '<Cmd>Lazy<CR>', { desc = 'Lazy' })
bind('n', '<leader>L', '<Cmd>Lazy profile<CR>', { desc = 'Lazy profile' })
