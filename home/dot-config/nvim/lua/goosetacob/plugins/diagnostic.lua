return {
	"folke/trouble.nvim",
	config = function()
		local trouble = require("trouble")
		-- diagnostics
		vim.keymap.set("n", "vd", vim.diagnostic.open_float)
		vim.keymap.set("n", "vdd", function() trouble.toggle("quickfix") end)
		vim.keymap.set("n", "[d", vim.diagnostic.goto_next)
		vim.keymap.set("n", "]d", vim.diagnostic.goto_prev)
		vim.keymap.set("n", "vr", function() trouble.toggle("lsp_references") end)

		-- vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
		-- vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
		-- vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
		-- vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
		-- vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
		-- vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)
	end,
}
