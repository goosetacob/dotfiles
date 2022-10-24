-- Docs: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local lspconfig = require 'lspconfig'
local cmp_nvim_lsp = require 'cmp_nvim_lsp'

local custom_attach = function(client, bufnr)
	client.server_capabilities.document_formatting = true
end

local custom_capabilities = vim.lsp.protocol.make_client_capabilities()
custom_capabilities = cmp_nvim_lsp.update_capabilities(custom_capabilities)

local sumneko_root_path = vim.env.HOME .. '/.local/bin/lua-language-server'
local sumneko_binary = sumneko_root_path .. '/bin/macOS/lua-language-server'

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

lspconfig.sumneko_lua.setup {
	capabilities = custom_capabilities,
	cmd = {sumneko_binary, '-E', sumneko_root_path .. '/main.lua'},
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = 'LuaJIT',
				-- Setup your lua path
				path = runtime_path
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = {'vim'}
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file('', true)
			},
			telemetry = {
				-- Do not send telemetry data containing a randomized but unique identifier
				enable = false
			}
		}
	}
}

lspconfig.tsserver.setup {
	capabilities = custom_capabilities,
	handlers = {
		-- disable diagnostics from tsserver, user efm's eslint/prettier
		['textDocument/publishDiagnostics'] = function() end
	},
	on_attach = function(client)
		custom_attach(client)
		client.server_capabilities.document_formatting = false
	end
}
local eslint = {
	lintCommand = 'eslint_d -f unix --stdin --stdin-filename ${INPUT}',
	lintStdin = true,
	lintFormats = {'%f:%l:%c: %m'},
	lintIgnoreExitCode = true,
	formatCommand = 'eslint_d --fix-to-stdout --stdin --stdin-filename ${INPUT}',
	formatStdin = true
}
local prettier = {
	formatCommand = 'prettier --find-config-path --stdin-filepath ${INPUT}',
	formatStdin = true
}
local lua_format = {
	formatCommand = 'lua-format -i --use-tab --indent-width=1 --continuation-indent-width=1 --chop-down-table --chop-down-kv-table --no-break-after-operator --break-after-table-lb --break-before-table-rb --double-quote-to-single-quote',
	formatStdin = true
}
lspconfig.efm.setup {
	capabilities = custom_capabilities,
	init_options = {documentFormatting = true},
	on_attach = custom_attach,
	filetypes = {
		'javascript',
		'javascriptreact',
		'typescript',
		'typescriptreact',
		'lua'
	},
	settings = {
		rootMarkers = {'.git/'},
		languages = {
			javascript = {eslint, prettier},
			javascriptreact = {eslint, prettier},
			typescript = {eslint, prettier},
			typescriptreact = {eslint, prettier},
			lua = {lua_format}
		}
	}
}
lspconfig.jsonls.setup {
	capabilities = custom_capabilities,
	on_attach = function(client)
		custom_attach(client)
	end
}

lspconfig.terraformls.setup {
	capabilities = custom_capabilities,
	on_attach = function(client)
		custom_attach(client)
		client.server_capabilities.document_formatting = false
	end
}

lspconfig.gopls.setup {
	capabilities = custom_capabilities,
	settings = {gopls = {analyses = {unusedparams = true}, staticcheck = true}},
	on_attach = function(client)
		custom_attach(client)
	end
}

-- lspconfig.sqls.setup {
-- 	capabilities = custom_capabilities,
-- 	on_attach = custom_attach
-- }

-- lspconfig.rust_analyzer.setup {
-- 	on_attach = custom_attach,
-- 	settings = {
-- 		['rust-analyzer'] = {
-- 			imports = {granularity = {group = 'module'}, prefix = 'self'},
-- 			cargo = {buildScripts = {enable = true}},
-- 			procMacro = {enable = true}
-- 		}
-- 	}
-- }

-- https://sharksforarms.dev/posts/neovim-rust/
require('rust-tools').setup({
	tools = { -- rust-tools options
		autoSetHints = true,
		-- hover_with_actions = true,
		inlay_hints = {
			show_parameter_hints = true,
			parameter_hints_prefix = '',
			other_hints_prefix = '=> ',
			highlight = 'Comment'
		}
	},

	-- all the opts to send to nvim-lspconfig
	-- these override the defaults set by rust-tools.nvim
	-- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
	server = {
		-- on_attach is a callback called when the language server attachs to the buffer
		-- on_attach = on_attach,
		settings = {
			-- to enable rust-analyzer settings visit:
			-- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
			['rust-analyzer'] = {
				-- enable clippy on save
				checkOnSave = {command = 'clippy'}
				-- server = {
				-- 	extra_env = {
				-- 		DATABASE_URL = 'mysql://127.0.0.1:3306' -- planetscale
				-- 	}
				-- }
			}
		}
	}
})

lspconfig.taplo.setup {}

lspconfig.pylsp.setup {}

-- lspconfig.svelte.setup{ on_attach=on_attach }

-- lspconfig.bashls.setup{ on_attach=on_attach }

-- lspconfig.cssls.setup{
-- 	on_attach=on_attach,
-- 	capabilities = capabilities,
-- }

-- lspconfig.html.setup{
-- 	on_attach=on_attach,
-- 	capabilities = capabilities,
-- }
