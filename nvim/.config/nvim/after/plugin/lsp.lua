local lsp = require('lsp-zero')
local nullls = require('null-ls')
local mason_nullls = require("mason-null-ls")

lsp.preset('recommended')

lsp.ensure_installed({
	'bashls',
	'gopls',
	'jsonls',
	'pylsp',
	'sumneko_lua',
	'taplo', -- toml
	'terraformls',
	'tsserver',
})

-- Fix Undefined global 'vim'
lsp.configure('sumneko_lua', {
	settings = {
		Lua = {
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { 'vim' }
			},
			telemetry = {
				-- Do not send telemetry data containing a randomized but unique identifier
				enable = false
			},
		}
	}
})

-- using prettier for formatting
lsp.configure("tsserver", {
	handlers = {
		-- disable diagnostics from tsserver, user efm's eslint/prettier
		['textDocument/publishDiagnostics'] = function() end
	},
	on_init = function(client)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentFormattingRangeProvider = false
	end
})

lsp.configure("gopls", {
	settings = {
		gopls = {
			analyses = {
				unusedparams = true
			},
			staticcheck = true
		}
	},
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	["<C-Space>"] = cmp.mapping.complete(),
	['<C-u>'] = cmp.mapping.scroll_docs(-4),
	['<C-d>'] = cmp.mapping.scroll_docs(4),
	['<C-e>'] = cmp.mapping.close(),
	--['<C-y>'] = cmp.mapping.confirm({ select = true }),
	['<CR>'] = cmp.mapping.confirm {
		select = true,
		{ 'i', 'c' }
	}
})
-- disable completion with tab
-- this helps with copilot setup
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
	experimental = { native_menu = false, ghost_text = false }
})

lsp.set_preferences({
	suggest_lsp_servers = false,
	sign_icons = {
		error = 'E',
		warn = 'W',
		hint = 'H',
		info = 'I'
	}
})

lsp.on_attach(function(_, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, opts)
	vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "<leader>grn", vim.lsp.buf.rename, opts)
	vim.keymap.set("n", "<leader>gws", vim.lsp.buf.workspace_symbol, opts)
	vim.keymap.set("n", "<leader>gca", vim.lsp.buf.code_action, opts)

	-- diagnostics
	vim.keymap.set("n", "vd", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)

	vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, opts)

	vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)

local rust_lsp = lsp.build_options('rust_analyzer', {})

nullls.setup({
	sources = {
		nullls.builtins.formatting.prettierd,
		nullls.builtins.formatting.eslint_d,
	}
})

mason_nullls.setup({
	ensure_installed = nil,
	automatic_installation = true,
	automatic_setup = false,
})

lsp.setup()

require('rust-tools').setup({
	server = rust_lsp,
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
})

vim.diagnostic.config({
	virtual_text = true,
})
