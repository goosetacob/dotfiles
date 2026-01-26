return {
	"tpope/vim-rhubarb",
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>gl", vim.cmd.GBrowse)
			vim.keymap.set("v", "<leader>gl", function()
				vim.cmd([['<,'>GBrowse]])
			end)
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "+" },
					change = { text = "~" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
				},
			})
		end,
	},
}
