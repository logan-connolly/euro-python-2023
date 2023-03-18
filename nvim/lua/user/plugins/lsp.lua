--
-- Plugins for improved coding experience.
--

return {
	-- Installs Mason a portable package manager for
	-- Neovim that runs everywhere Neovim runs. Easily
	-- install and manage LSP servers, DAP servers,
	-- linters, and formatters.
	--
	-- source: https://github.com/williamboman/mason.nvim
	-- documentation: `:help Mason`
	-- command: `:Mason` to open dashboard
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		opts = {
			ensure_installed = {
				-- Python
				"pyright",
				"black",
				"isort",
				-- Lua
				"lua-language-server",
			},
		},
		config = function(plugin, opts)
			require("mason").setup(opts)
			local mr = require("mason-registry")
			for _, tool in ipairs(opts.ensure_installed) do
				local p = mr.get_package(tool)
				if not p:is_installed() then
					p:install()
				end
			end
		end,
	},

	-- Installs LSP Config plugin, which is Neovim's official
	-- API for interacting with attaching and interacting with
	-- downloaded language servers.
	--
	-- source: https://github.com/neovim/nvim-lspconfig
	-- documentation: `:help lsp`
	{
		"neovim/nvim-lspconfig",
		event = "BufReadPre",
		keys = {
			{ "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "Go to definition" },
			{ "gr", "<cmd>lua vim.lsp.buf.references()<cr>", desc = "Get references" },
			{ "K", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "Check signature help" },
			{ "<c-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", desc = "Check signature help", mode = "i" },
			{ "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename symbol" },
		},
		config = function(plugin, opts)
			local lspconfig = require("lspconfig")

			-- set diagnostic visual settings
			vim.diagnostic.config({
				virtual_text = false,
				update_in_insert = false,
			})

			-- setup Python (pyright) language server
			lspconfig.pyright.setup({})

			-- format Python files on save
			vim.api.nvim_create_autocmd(
				{ "BufWritePre" },
				{ pattern = { "*.py" }, command = [[lua vim.lsp.buf.format { async = true }]] }
			)

			-- setup Lua language server
			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						diagnostics = { globals = { "vim" } },
						workspace = { library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false },
						telemetry = { enable = false },
					},
				},
			})
		end,
	},

	-- Installs Mini Completion module that adds autocomplete
	-- functionality to the editor by interacting with the
	-- LSP client.
	--
	-- source: https://github.com/echasnovski/mini.nvim
	-- documentation: `:help mini.completion`
	{
		"echasnovski/mini.completion",
		event = "BufReadPre",
		config = function(_, opts)
			require("mini.completion").setup({
				source_func = "omnifunc",
				auto_setup = false,
			})
		end,
	},

	-- Installs "null-ls" a package that allows you to
	-- treat packages that are not necessarily language
	-- servers interact with the LSP client.
	--
	-- source: https://github.com/echasnovski/mini.nvim
	-- documentation: `:help mini.completion`
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = "BufReadPre",
		dependencies = { "mason.nvim" },
		opts = function()
			local nls = require("null-ls")
			return {
				sources = {
					nls.builtins.formatting.black,
					nls.builtins.formatting.isort,
				},
			}
		end,
	},

	-- Installs Treesitter a package that provides a simple
	-- way to use the interface for tree-sitter, providing
	-- some basic functionality such as improved highlighting.
	--
	-- source: https://github.com/nvim-treesitter/nvim-treesitter
	-- documentation: `:help treesitter`
	{
		"nvim-treesitter/nvim-treesitter",
		tag = "v0.8.4",
		build = ":TSUpdate",
		event = "BufReadPost",
		opts = {
			highlight = { enable = true },
			indent = { enable = false },
			ensure_installed = { "lua", "python" },
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
