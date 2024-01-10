return {
	"nvim-lua/plenary.nvim", -- lua fn that many plugins use

	-- rando tools
	"sindrets/diffview.nvim",
	"tpope/vim-sensible",
	"tpope/vim-surround",
	"tpope/vim-sleuth",

	{
		"j-hui/fidget.nvim", -- Useful lsp status updates
		tag = "legacy",
		config = function()
			require("fidget").setup()
		end,
	},

	{
		"folke/neodev.nvim",
		config = function()
			require("neodev").setup()
		end,
	},
}
