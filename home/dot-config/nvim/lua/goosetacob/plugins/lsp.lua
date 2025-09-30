return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		-- { "mason-org/mason.nvim", version = "~1.0.0" },
		"mason-org/mason.nvim",
		-- { "mason-org/mason-lspconfig.nvim", version = "~1.0.0" },
		"mason-org/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		{
			"folke/lazydev.nvim",
			ft = "lua", -- only load on lua files
			opts = {
				library = {
					-- See the configuration section for more details
					-- Load luvit types when the `vim.uv` word is found
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},
	},
	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		require("mason").setup()

		local on_attach = function(_, bufnr)
			local opts = { buffer = bufnr, remap = false }

			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			vim.keymap.set(
				"n",
				"<leader>gd",
				vim.lsp.buf.definition,
				{ buffer = bufnr, remap = false, desc = "[G]o to [D]efinition" }
			)
			vim.keymap.set(
				"n",
				"<leader>gi",
				vim.lsp.buf.implementation,
				{ buffer = bufnr, remap = false, desc = "[G]o to [I]mplementation" }
			)
			vim.keymap.set(
				"n",
				"<leader>grr",
				vim.lsp.buf.references,
				{ buffer = bufnr, remap = false, desc = "[G]o to [R]eferences" }
			)
			vim.keymap.set(
				"n",
				"<leader>grn",
				vim.lsp.buf.rename,
				{ buffer = bufnr, remap = false, desc = "[G]o [r]e[n]ame" }
			)
			-- vim.keymap.set("n", "<leader>gws", vim.lsp.buf.workspace_symbol, opts)
			vim.keymap.set("n", "<leader>ga", vim.lsp.buf.code_action, opts)

			vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
		end

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		require("mason-lspconfig").setup({
			automatic_enable = true,
			automatic_installation = false,
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
			handlers = {
				-- Default handler - applies to all servers without a dedicated handler
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = capabilities,
						on_attach = on_attach,
						offset_encoding = "utf-16",
					})
				end,

				-- Custom handlers for specific servers
				ts_ls = function()
					lspconfig.ts_ls.setup({
						capabilities = capabilities,
						on_attach = on_attach,
						offset_encoding = "utf-16",
					})
				end,
				pyright = function()
					lspconfig.pyright.setup({
						capabilities = capabilities,
						on_attach = on_attach,
						offset_encoding = "utf-16",
						settings = {
							pyright = {
								disableOrganizeImports = true,
							},
							python = {
								analysis = {
									ignore = { "*" },
								},
							},
						},
					})
				end,
				ruff = function()
					lspconfig.ruff.setup({
						capabilities = capabilities,
						on_attach = on_attach,
						offset_encoding = "utf-16",
						on_init = function(client)
							client.server_capabilities.hoverProvider = false
						end,
					})
				end,
				lua_ls = function()
					local runtime_path = vim.split(package.path, ";")
					table.insert(runtime_path, "lua/?.lua")
					table.insert(runtime_path, "lua/?/init.lua")
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						on_attach = on_attach,
						offset_encoding = "utf-16",
						settings = {
							Lua = {
								telemetry = { enable = false },
								runtime = {
									version = "LuaJIT",
									path = runtime_path,
								},
								diagnostics = {
									globals = { "vim" },
								},
								workspace = {
									checkThirdParty = false,
									library = {
										vim.fn.expand("$VIMRUNTIME/lua"),
										vim.fn.stdpath("config") .. "/lua",
									},
								},
							},
						},
					})
				end,
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
