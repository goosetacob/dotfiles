-- https://vim.fandom.com/wiki/Highlight_current_line
local cursorLine = vim.api.nvim_create_augroup("CursorLine", { clear = true })
vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
	desc = "Enable cursorline in active window",
	pattern = "*",
	group = cursorLine,
	command = "set cursorline",
})
vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
	desc = "Diable cursorline in active window",
	pattern = "*",
	group = cursorLine,
	command = "set nocursorline",
})

vim.api.nvim_create_autocmd("BufEnter", {
	desc = "Don't auto comment on newline",
	group = vim.api.nvim_create_augroup("NoNewlineComment", { clear = true }),
	command = [[set formatoptions-=cro]],
})

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = vim.api.nvim_create_augroup("HighlightYank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
