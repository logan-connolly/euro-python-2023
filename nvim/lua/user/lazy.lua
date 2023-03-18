-- Bootstrap Lazy package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Settings for the plugin manager.
require("lazy").setup({

	spec = {
		-- import plugin cofigurations from this module
		{ import = "user.plugins" },
	},
	defaults = {
		-- load plugins lazily for faster startup time
		lazy = true,
	},
	performance = {
		rtp = {
			-- disable unused builtin neovim plugins
			disabled_plugins = {
				"getscript",
				"getscriptPlugin",
				"gzip",
				"logipat",
				"matchit",
				"matchparen",
				"rrhelper",
				"spellfile_plugin",
				"tar",
				"tarPlugin",
				"tohtml",
				"zip",
				"zipPlugin",
				"vimball",
				"vimballPlugin",
				"2html_plugin",
			},
		},
	},
})
