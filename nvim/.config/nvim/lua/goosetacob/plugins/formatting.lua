return {
	"stevearc/conform.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				lua = { "stylua" },
				python = { "black" },
			},
			-- format_on_save = {
			-- 	lsp_fallback = true,
			-- 	async = false,
			-- 	timeout_ms = 1000,
			-- },
		})

		-- old ones
		-- vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, opts)
		-- vim.keymap.set("v", "<leader>ff", "[[<ESC><cmd>lua vim.lsp.buf.range_formatting()<CR>]]", opts)
		-- vim.keymap.set('v', '<leader>ff', function()
		-- 	vim.lsp.buf.
		-- 	vim.lsp.buf.range_formatting()
		-- end, opts)

		vim.keymap.set({ "n", "v" }, "<leader>ff", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
