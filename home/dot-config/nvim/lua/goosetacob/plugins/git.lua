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
			local gs = require("gitsigns")
			gs.setup({
				signs = {
					add = { text = "+" },
					change = { text = "~" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
				},
			})
			vim.api.nvim_create_autocmd("BufEnter", {
				callback = function(ev)
					if vim.bo[ev.buf].buftype ~= "" or vim.api.nvim_buf_get_name(ev.buf) == "" then
						return
					end
					vim.schedule(function()
						if vim.api.nvim_buf_is_valid(ev.buf) and vim.bo[ev.buf].buftype == "" then
							gs.attach(ev.buf)
						end
					end)
				end,
			})
		end,
	},
}
