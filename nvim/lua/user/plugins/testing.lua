--
-- Plugins for testing your code.
--

return {
	-- Installs Vim-Test a plugin that allows you to
	-- trigger tests from your editor. I have configured
	-- it to work with a toggleterm session.
	--
	-- source: https://github.com/vim-test/vim-test
	{
		"vim-test/vim-test",
		event = "VeryLazy",
		config = function()
			local tt = require("toggleterm")
			local terminal = require("toggleterm.terminal")

			vim.g["test#custom_strategies"] = {
				tterm = function(cmd)
					tt.exec(cmd)
				end,

				tterm_close = function(cmd)
					local term_id = 0
					tt.exec(cmd, term_id)
					terminal.get_or_create_term(term_id):close()
				end,
			}
			vim.g["test#strategy"] = "tterm"
			vim.g["test#python#pytest#options"] = "-vv"
		end,
		keys = {
			{ "<leader>tt", "<cmd>TestNearest<cr>", desc = "Test closest" },
			{ "<leader>tf", "<cmd>TestFile<cr>", desc = "Test file" },
			{ "<leader>ta", "<cmd>TestSuite<cr>", desc = "Test suite" },
			{ "<leader>tl", "<cmd>TestLast<cr>", desc = "Test last" },
			{ "<leader>tv", "<cmd>TestVisit<cr>", desc = "Test visit" },
		},
	},
}
