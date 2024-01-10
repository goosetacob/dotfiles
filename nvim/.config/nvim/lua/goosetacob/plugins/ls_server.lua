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
				'bashls',
				'clangd',
				-- 'gopls',
				'jsonls',
				'lua_ls', -- 'sumneko_lua',
				'pylsp',
				'taplo', -- toml
				'terraformls',
				'tsserver',
			}
		})

		require("mason-tool-installer").setup({
			ensure_installed = {
				-- js
				"eslint_d", -- linter
				"prettierd", -- formatter
				-- lua
				"stylua", -- formatter
				-- python	
				"black", -- formatter
			},
		})
	end,
}
