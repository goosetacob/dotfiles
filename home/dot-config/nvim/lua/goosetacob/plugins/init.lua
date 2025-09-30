return {
	"nvim-lua/plenary.nvim", -- lua fn that many plugins use

	-- rando tools
	"sindrets/diffview.nvim",
	"tpope/vim-sensible",
	"tpope/vim-surround",
	"tpope/vim-sleuth",
	"tpope/vim-abolish",
	{
		"j-hui/fidget.nvim", -- Useful lsp status updates
		tag = "legacy",
		config = function()
			require("fidget").setup()
		end,
	},
}
