-- super helpful video (basically copied all of it): https://www.youtube.com/watch?v=_DnmphIwnjo
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

local cmp = require 'cmp'
local lspkind = require 'lspkind'
local luasnip = require 'luasnip'

lspkind.init()

cmp.setup {
	snippet = {expand = function(args) luasnip.lsp_expand(args.body) end},
	mapping = {
		['<C-n>'] = cmp.mapping.select_next_item {
			behavior = cmp.SelectBehavior.Insert
		},
		['<C-p>'] = cmp.mapping.select_prev_item {
			behavior = cmp.SelectBehavior.Insert
		},
		['<C-u>'] = cmp.mapping.scroll_docs(-4),
		['<C-d>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<CR>'] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
			{'i', 'c'}
		}
	},
	sources = {
		{name = 'nvim_lua'},
		{name = 'nvim_lsp'},
		{name = 'spell', keyword_length = 5},
		{name = 'path'},
		{name = 'luasnip'},
		{name = 'buffer', keyword_length = 5}
	},
	formatting = {
		format = lspkind.cmp_format {
			with_text = true,
			menu = {
				buffer = '[buf]',
				luasnip = '[snip]',
				nvim_lsp = '[lsp]',
				nvim_lua = '[api]',
				path = '[path]',
				spell = '[spell]'
			}
		}
	},
	experimental = {native_menu = false, ghost_text = false}
}
