local on_attach = require'completion'.on_attach
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true


-- https://github.com/neovim/nvim-lspconfig/tree/master/lua/lspconfig
require'lspconfig'.tsserver.setup{ on_attach=on_attach }
require'lspconfig'.gopls.setup{ on_attach=on_attach }
-- require'lspconfig'.pyls.setup{ on_attach=require'completion'.on_attach }
require'lspconfig'.rust_analyzer.setup{ on_attach=on_attach }
require'lspconfig'.svelte.setup{ on_attach=on_attach }
require'lspconfig'.terraformls.setup{ on_attach=on_attach }
require'lspconfig'.bashls.setup{ on_attach=on_attach }
require'lspconfig'.cssls.setup{
	on_attach=on_attach,
	capabilities = capabilities,
}
require'lspconfig'.html.setup{
	on_attach=on_attach,
	capabilities = capabilities,
}
