--
-- Plugins for navigating around your codebase.
--

return {
	-- Installs Telescope a highly extendable fuzzy finder
	-- for your files, buffers, help docs, etc.
	--
	-- source: https://github.com/nvim-telescope/telescope.nvim
	-- documentation: `:help telescope.nvim`
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		dependencies = {
			-- helper plugin that telescope relies on
			{ "nvim-lua/plenary.nvim" },
			-- icons to show file types
			{ "nvim-tree/nvim-web-devicons" },
			-- file browser extension
			{ "nvim-telescope/telescope-file-browser.nvim" },
		},
		keys = {
			{ "<leader>ff", "<cmd> Telescope find_files <CR>", desc = "Search Files" },
			{ "<leader>fc", "<cmd> Telescope find_files cwd=/root/.config/nvim <CR>", desc = "Search Config" },
			{ "<leader>fw", "<cmd> Telescope live_grep <CR>", desc = "Live Grep" },
			{ "<leader>fb", "<cmd> Telescope buffers <CR>", desc = "Find Buffers" },
			{ "<leader>fh", "<cmd> Telescope help_tags <CR>", desc = "Help Page" },
			{ "<leader>fo", "<cmd> Telescope oldfiles <CR>", desc = "Search Recent" },
			{ "<leader>fk", "<cmd> Telescope keymaps <CR>", desc = "Show Keys" },
			{ "<leader>fg", "<cmd> Telescope git_status <CR>", desc = "Show Git Status" },
			{
				"-",
				function()
					require("telescope").extensions.file_browser.file_browser({
						cwd = require("telescope.utils").buffer_dir(),
					})
				end,
				desc = "Open file browser in buffer dir (vinegar)",
			},
		},
		config = function()
			local telescope = require("telescope")
			telescope.setup({})
			telescope.load_extension("file_browser")
		end,
	},

	-- Installs Mini Bracketed module which allows you to
	-- go forward and backwards on different targets like
	-- diagnostics, buffers, comments, among others.
	--
	-- source: https://github.com/echasnovski/mini.nvim
	-- documentation: `:help mini.bracketed`
	{
		"echasnovski/mini.bracketed",
		event = "VeryLazy",
		config = function(_, opts)
			require("mini.bracketed").setup(opts)
		end,
	},
}
