-- Docs: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
local lspconfig = require'lspconfig'
local saga = require 'lspsaga'

saga.init_lsp_saga()

local custom_attach = function(client, bufnr)
	client.resolved_capabilities.document_formatting = true
end

local custom_capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local sumneko_root_path = vim.env.HOME..'/Projects/mac-os-conf/third-party-builds/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/macOS/lua-language-server"
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
lspconfig.sumneko_lua.setup {
	capabilities = custom_capabilities,
	cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = 'LuaJIT',
				-- Setup your lua path
				path = runtime_path,
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = {'vim'},
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				-- Do not send telemetry data containing a randomized but unique identifier
				enable = false,
			},
		},
	},
}

lspconfig.tsserver.setup {
	capabilities = custom_capabilities,
	on_attach = function(client)
		custom_attach(client)
		client.resolved_capabilities.document_formatting = false
	end
}
local eslint = {
	lintCommand = 'eslint_d -f unix --stdin --stdin-filename ${INPUT}',
	lintStdin = true,
    lintFormats = {
		"%f:%l:%c: %m",
	},
	lintIgnoreExitCode = true,
	formatCommand = 'eslint_d --fix-to-stdout --stdin --stdin-filename ${INPUT}',
	formatStdin = true
}
local prettier = {
	formatCommand = 'prettier --find-config-path --stdin-filepath ${INPUT}',
	formatStdin = true
}
lspconfig.efm.setup {
	capabilities = custom_capabilities,
	init_options = {documentFormatting = true},
	on_attach = custom_attach,
	filetypes = {
		'javascript',
		'typescript',
	},
	settings = {
		rootMarkers = {'.git/'},
		languages = {
			javascript = {eslint, prettier},
			typescript = {eslint, prettier},
		}
	}
}

lspconfig.terraformls.setup{
	capabilities = custom_capabilities,
	on_attach = function(client)
		custom_attach(client)
		client.resolved_capabilities.document_formatting = false
	end
}

lspconfig.gopls.setup {
	capabilities = custom_capabilities,
	on_attach=custom_attach,
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
}

-- lspconfig.rust_analyzer.setup{ on_attach=on_attach }

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
