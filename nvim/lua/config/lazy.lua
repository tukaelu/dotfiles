local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
	vim.fn.system({
		"git",
		"-C",
		lazypath,
		"checkout",
		"tags/stable"
	})
end
vim.opt.runtimepath:prepend(lazypath)

local M = {}

function M.load(opts)
	opts = vim.tbl_deep_extend("force", {
		spec = {
			{ import = "plugins" },
		},
		defaults = { lazy = true },
		install = { missing = true, colorscheme = { "kanagawa" } },
		checker = { enabled = false },
		concurrency = 64,
		performance = {
			cache = {
				enabled = true,
			},
			rtp = {
				disabled_plugins = {
					"gzip",
					"matchit",
					--"matchparen",
					--"netrwPlugin",
					--"netrw",
					"tarPlugin",
					"tar",
					"tohtml",
					"tutor",
					"zipPlugin",
					"zip",
				},
			},
		},
	}, opts or {})
	require("lazy").setup(opts)
end

return M
