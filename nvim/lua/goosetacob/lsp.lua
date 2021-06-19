-- Docs: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md
local lspconfig = require'lspconfig'
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(client)
	require'completion'.on_attach(client)
end

lspconfig.tsserver.setup{ on_attach=on_attach }

lspconfig.gopls.setup{ on_attach=on_attach }

lspconfig.rust_analyzer.setup{ on_attach=on_attach }

lspconfig.svelte.setup{ on_attach=on_attach }

lspconfig.terraformls.setup{ on_attach=on_attach }

lspconfig.bashls.setup{ on_attach=on_attach }

lspconfig.cssls.setup{
	on_attach=on_attach,
	capabilities = capabilities,
}

lspconfig.html.setup{
	on_attach=on_attach,
	capabilities = capabilities,
}
