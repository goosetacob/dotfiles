return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		require("mason").setup({})

		require("mason-lspconfig").setup({
			-- list of servers for mason to install
			ensure_installed = {
				"bashls",
				"lua_ls",
				"pyright",
				"taplo", -- toml
				"terraformls",
				"ts_ls",
				"ruff", -- python
				-- "sqlfluff",
			},
		})

		require("mason-tool-installer").setup({
			ensure_installed = {
				"eslint_d", -- js linter
				"prettierd", -- js formatter
				"stylua", -- lua formatter
				-- "sql-formatter",
				"sqlfluff",
			},
		})
	end,
}
