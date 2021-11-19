-- Useful Docs:
-- https://neovim.io/doc/user/lsp.html
-- https://github.com/nanotee/nvim-lua-guide
-- https://github.com/svermeulen/vimpeccable

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
		underline = true,
		virtual_text = false,
		signs = true,
		update_in_insert = true,
	}
)

vim.o.termguicolors = true

require('goosetacob.colors')
require('goosetacob.completion')
require('goosetacob.lsp')
require('goosetacob.lualine')
require('goosetacob.telescope')
require('goosetacob.treesitter')
