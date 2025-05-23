return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"L3MON4D3/LuaSnip", -- snippet engine
		"saadparwaiz1/cmp_luasnip", -- for autocompletion
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path", -- source for file system paths
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"f3fora/cmp-spell",
		"rafamadriz/friendly-snippets", -- useful snippets
		"onsails/lspkind.nvim", -- vs-code like pictograms
	},
	config = function()
		local cmp = require("cmp")
		local context = require("cmp.config.context")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		-- loads VSCode style snippets from installed plugins (e.g. friendly-snippets)
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			snippet = { -- configure how nvim-cmp interacts with snippet engine
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},

			mapping = cmp.mapping.preset.insert({
				["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
				["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-u>"] = cmp.mapping.scroll_docs(-4),
				["<C-d>"] = cmp.mapping.scroll_docs(4),
				["<C-e>"] = cmp.mapping.close(),
				--['<C-y>'] = cmp.mapping.confirm({ select = true }),
				["<CR>"] = cmp.mapping.confirm({
					select = true,
					{ "i", "c" },
				}),
				["<Tab>"] = nil,
				["<S-Tab>"] = nil,
			}),

			sources = cmp.config.sources({
				{ name = "nvim_lua" }, -- neovim lua api
				{ name = "nvim_lsp" },
				{ name = "luasnip" }, -- snippets
				{ name = "buffer" }, -- text within current buffer
				{
					name = "spell",
					option = {
						keep_all_entries = false,
						enable_in_context = function()
							return context.in_treesitter_capture("spell")
						end,
						preselect_correct_word = true,
					},
				},
				{ name = "path" }, -- file system paths
			}),

			-- configure lspkind for vs-code like pictograms in completion menu
			formatting = {
				expandable_indicator = false,
				fields = { "abbr", "kind", "menu" },
				format = lspkind.cmp_format({
					mode = "symbol",
					maxwidth = 50,
					ellipsis_char = "...",
					menu = {
						nvim_lsp = "[LSP]",
						nvim_lua = "[LUA]",
						beancount = "[BEAN]",
						spell = "[SPELL]",
						treesitter = "[TREE]",
						async_path = "[PATH]",
						buffer = "[BUF]",
						calc = "[CALC]",
						commitlint = "[COMMIT]",
					},
				}),
			},
			experimental = { native_menu = false, ghost_text = false },
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
		})
	end,
}
