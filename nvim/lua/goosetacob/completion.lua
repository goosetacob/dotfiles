-- super helpful video (basically copied all of it): https://www.youtube.com/watch?v=_DnmphIwnjo
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

local cmp = require 'cmp'
local lspkind = require 'lspkind'
cmp.setup {
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	mapping = {
		['<C-u>'] = cmp.mapping.scroll_docs(-4),
		['<C-d>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<CR>'] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
			select = true
		},
	},
	sources = {
		{ name = "nvim_lua" },
		{ name = "zsh" },
		{ name = 'nvim_lsp' },
		{ name = "path" },
		{ name = 'luasnip' },
		{ name = 'buffer', keyword_length = 5 },
	},
	formatting = {
		format = lspkind.cmp_format {
			with_text = true,
			menu = {
				buffer = "[buf]",
				nvim_lsp = "[lsp]",
				nvim_lua = "[api]",
				path = "[path]",
				luasnip = "[snip]",
			},
		},
	},
	experimental = {
		native_menu = false,
		ghost_text = true,
	},
}
