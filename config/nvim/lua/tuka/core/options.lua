vim.cmd('autocmd!')

local opt = vim.opt
local api = vim.api

-- file encoding
vim.scriptencoding = 'utf-8'
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'

-- file open / save
opt.confirm = true
opt.autoread = true

-- title
opt.title = true

-- line numbers
vim.wo.number = true

-- tabs / indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.breakindent = true

-- status line
opt.showcmd = true
opt.cmdheight = 1
opt.laststatus = 2

-- line wrapping
opt.wrap = false
opt.showbreak = '››'
opt.whichwrap = 'b,s,h,l,<,>,[,]'

-- search
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.wrapscan = true
opt.inccommand = 'split'
opt.path:append { '**' } -- Finding files - Search down into subfolders
opt.wildignore:append { '*/node_modules/*' }

-- backup
opt.backup = false
opt.backupskip = { '/tmp/*', '/private/tmp/*' }
api.noswapfile = true

-- backspace
opt.backspace = { 'start', 'eol', 'indent' }

-- mouse & clipboard
opt.mouse = 'a'
opt.clipboard:append('unnamedplus')

-- terminal
opt.termguicolors = true
opt.ttyfast = true
opt.scrolloff = 10
opt.cursorline = true
opt.background = 'dark'
opt.wildoptions = 'pum'
opt.pumblend = 5

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
api.nvim_create_autocmd('InsertLeave', {
  pattern = '*',
  command = "set nopaste"
})

opt.formatoptions:append { 'lmoq' }
