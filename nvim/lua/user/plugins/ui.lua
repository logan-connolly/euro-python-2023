--
-- Plugins for altering the user interface.
--

return {
	-- Install Gruvbox Material colorscheme.
	--
	-- source: https://github.com/wittyjudge/gruvbox-material
	{
		"wittyjudge/gruvbox-material.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			vim.cmd("colorscheme gruvbox-material")
		end,
	},

	-- Install Mini Starter for a more useful startup screen.
	--
	-- source: https://github.com/echasnovski/mini.nvim
	-- documentation: `:help mini.starter`
	{
		"echasnovski/mini.starter",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		opts = {
			header = "🐍 Euro Python 2023",
		},
		config = function(_, opts)
			require("mini.starter").setup(opts)
		end,
	},

	-- Install Lualine for a more useful statusline.
	--
	-- source: https://github.com/nvim-lualine/lualine.nvim
	-- documentation: `:help lualine.txt`
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		config = true,
	},
}
