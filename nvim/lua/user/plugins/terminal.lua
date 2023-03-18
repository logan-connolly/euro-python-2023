--
-- Plugins for terminal integration.
--

return {
	-- Installs Toggleterm an improved terminal experience
	-- in Neovim that you can toggle in floating mode.
	--
	-- source: https://github.com/akinsho/toggleterm.nvim
	-- documentation: `:help toggleterm.txt`
	{
		"akinsho/toggleterm.nvim",
		event = "VeryLazy",
		config = true,
		opts = {
			direction = "float",
			close_on_exit = true,
		},
		keys = {
			-- Double tap "\" key to toggle a terminal
			{ "\\\\", "<cmd>ToggleTerm<cr>", mode = { "n", "t" }, desc = "Toggle terminal" },
			-- Double tapping Esc from within the terminal puts you in normal model
			{ "<Esc><Esc>", [[<C-\><C-n>]], mode = "t", silent = true },
		},
	},
}
