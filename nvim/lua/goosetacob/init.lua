-- Useful Docs:
-- https://neovim.io/doc/user/lsp.html
-- https://github.com/nanotee/nvim-lua-guide
-- https://github.com/svermeulen/vimpeccable

local lsp = vim.lsp
local fn = vim.fn

lsp.handlers["textDocument/publishDiagnostics"] =
	lsp.with(
	lsp.diagnostic.on_publish_diagnostics,
	{
		underline = true,
		virtual_text = false,
		signs = true,
		update_in_insert = true,
	}
)

fn.sign_define("LspDiagnosticsSignError", { text = "✖", numhl = "LspDiagnosticsDefaultError" })
fn.sign_define("LspDiagnosticsSignWarning", { text = "▲", numhl = "LspDiagnosticsDefaultWarning" })
fn.sign_define("LspDiagnosticsSignInformation", { text = "⁈", numhl = "LspDiagnosticsDefaultInformation" })
fn.sign_define("LspDiagnosticsSignHint", { text = "❖", numhl = "LspDiagnosticsDefaultHint" })

require('goosetacob.telescope')
require('goosetacob.lualine')
require('goosetacob.lsp')
