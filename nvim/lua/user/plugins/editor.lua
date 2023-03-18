--
-- General plugins for editing text.
--

return {
	-- Installs Which Key which displays a popup with possible
	-- key bindings of the command you started typing.
	--
	-- source: https://github.com/folke/which-key
	-- documentation: `:help which-key.txt`
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function(_, opts)
			local wk = require("which-key")
			wk.setup(opts)
			wk.register({
				-- prompt only in NORMAL and VISUAL mode
				mode = { "n", "v" },
			})
		end,
	},

	-- Installs Mini Comment module which allows you to
	-- comment out a line based on the language you are
	-- using.
	--
	-- source: https://github.com/echasnovski/mini.nvim
	-- documentation: `:help mini.comment`
	{
		"echasnovski/mini.comment",
		event = "VeryLazy",
		config = function(_, opts)
			require("mini.comment").setup(opts)
		end,
	},
}
