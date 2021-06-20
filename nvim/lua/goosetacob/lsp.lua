-- Docs: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
local lspconfig = require'lspconfig'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(client, bufnr)
	client.resolved_capabilities.document_formatting = true
	require'completion'.on_attach(client, bufnr)
end

lspconfig.tsserver.setup {
	on_attach = function(client)
		on_attach(client)
		client.resolved_capabilities.document_formatting = false
	end
}

lspconfig.gopls.setup { on_attach=on_attach }

-- lspconfig.rust_analyzer.setup{ on_attach=on_attach }

-- lspconfig.svelte.setup{ on_attach=on_attach }

-- lspconfig.terraformls.setup{ on_attach=on_attach }

-- lspconfig.bashls.setup{ on_attach=on_attach }

-- lspconfig.cssls.setup{
-- 	on_attach=on_attach,
-- 	capabilities = capabilities,
-- }

-- lspconfig.html.setup{
-- 	on_attach=on_attach,
-- 	capabilities = capabilities,
-- }
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
	init_options = {documentFormatting = true},
	on_attach = on_attach,
	filetypes = {
		'javascript'
	},
	settings = {
		rootMarkers = {'.git/'},
		languages = {
			javascript = {eslint, prettier}
		}
	}
}

