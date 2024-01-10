return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("rose-pine").setup()

			vim.cmd("colorscheme rose-pine")
		end,
	},
	--	{
	--		"norcalli/nvim-colorizer.lua",
	--		config = function()
	--			require("colorizer").setup({ "*" }, {
	--				RGB = true, -- #RGB hex codes
	--				RRGGBB = true, -- #RRGGBB hex codes
	--				names = true, -- "Name" codes like Blue
	--				RRGGBBAA = true, -- #RRGGBBAA hex codes
	--				rgb_fn = true, -- CSS rgb() and rgba() functions
	--				hsl_fn = true, -- CSS hsl() and hsla() functions
	--				css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
	--				css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
	--			})
	--		end,
	--	},
}
