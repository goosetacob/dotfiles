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
					-- Load luvit types when the `vim.uv` word is found
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},
	},
	config = function()
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						checkThirdParty = false,
					},
					telemetry = {
						enable = false,
					},
				},
			},
		})

		vim.lsp.config("ts_ls", {
			settings = {
				typescript = {
					diagnostics = {
						ignoredCodes = {
							80001, -- File is a CommonJS module; it may be converted to an ES module.
						},
					},
				},
				javascript = {
					diagnostics = {
						ignoredCodes = {
							80001, -- File is a CommonJS module; it may be converted to an ES module.
						},
					},
				},
			},
		})

		vim.lsp.config("pyright", {
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

		vim.lsp.config("ruff", {
			on_init = function(client)
				client.server_capabilities.hoverProvider = false
			end,
		})

		vim.lsp.config("rust_analyzer", {
			settings = {
				["rust-analyzer"] = {
					cargo = {
						allFeatures = true,
						loadOutDirsFromCheck = true,
					},
					check = {
						command = "clippy",
						features = "all",
					},
					procMacro = {
						enable = true,
					},
					inlayHints = {
						lifetimeElisionHints = {
							enable = "always",
							useParameterNames = true,
						},
						maxLength = 25,
						parameterHintsPrefix = "<- ",
						otherHintsPrefix = "=> ",
					},
					completion = {
						addCallParentheses = true,
						addCallArgumentSnippets = true,
					},
				},
			},
		})

		require("mason").setup()

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
				"sqlls",
				"rust_analyzer",
			},
			handlers = {
				-- default handler
				function(server_name)
					vim.lsp.config(server_name, {
						capabilities = capabilities,
						offset_encoding = "utf-16",
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

		-- Set up LSP keybindings using LspAttach autocommand (modern pattern)
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
			callback = function(event)
				local bufnr = event.buf
				local client = vim.lsp.get_client_by_id(event.data.client_id)

				-- if client then
				-- 	print(string.format("LSP attached: %s to buffer %d", client.name, bufnr))
				-- end

				-- Enable inlay hints for supported servers
				if vim.lsp.inlay_hint and client:supports_method("textDocument/inlayHint") then
					vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
				end

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
				vim.keymap.set("n", "<leader>ga", vim.lsp.buf.code_action, opts)
				vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
			end,
		})
	end,
}
