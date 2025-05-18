return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
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

		lspconfig.ts_ls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			-- handlers = {
			--   -- disable diagnostics from tsserver
			--   ['textDocument/publishDiagnostics'] = function()
			--   end
			-- },
			-- on_init = function(client)
			--   client.server_capabilities.documentFormattingProvider = false
			--   client.server_capabilities.documentFormattingRangeProvider = false
			-- end,
			-- root_dir = lspconfig.util.root_pattern('package.json', 'tsconfig.json', 'jsconfig.json', '.git'),
			-- init_options = {
			--   hostInfo = 'neovim',
			--   -- tsserver = {
			--   -- 	logDirectory = os.getenv('HOME') .. '/.local/state/nvim',
			--   -- 	logVerbosity = 'normal',
			--   -- 	trace = 'verbose'
			--   -- },
			--   -- maxTsServerMemory = 4096 -- 4GB
			-- }
		})

		lspconfig.terraformls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig.bashls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig.pyright.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				pyright = {
					-- Using Ruff's import organizer
					disableOrganizeImports = true,
				},
				python = {
					analysis = {
						-- Ignore all files for analysis to exclusively use Ruff for linting
						ignore = { "*" },
					},
				},
			},
		})

		lspconfig.ruff.setup({
			settings = {
				path = { vim.fn.exepath("ruff") },
			},
			capabilities = capabilities,
			on_attach = on_attach,
			on_init = function(client)
				client.server_capabilities.hoverProvider = false
			end,
		})

		local runtime_path = vim.split(package.path, ";")
		table.insert(runtime_path, "lua/?.lua")
		table.insert(runtime_path, "lua/?/init.lua")
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
					-- Disable telemetry
					telemetry = { enable = false },
					runtime = {
						-- Tell the language server which version of Lua you're using
						-- (most likely LuaJIT in the case of Neovim)
						version = "LuaJIT",
						path = runtime_path,
					},
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = { "vim" },
					},
					workspace = {
						checkThirdParty = false,
						library = {
							-- Make the server aware of Neovim runtime files
							vim.fn.expand("$VIMRUNTIME/lua"),
							vim.fn.stdpath("config") .. "/lua",
						},
					},
				},
			},
		})
	end,
}
