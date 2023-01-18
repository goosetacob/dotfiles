-- show cursor line only in active window
-- https://vim.fandom.com/wiki/Highlight_current_line
local cursorGrp = vim.api.nvim_create_augroup('CursorLine', { clear = true })
vim.api.nvim_create_autocmd(
	{ 'InsertLeave', 'WinEnter' },
	{ pattern = '*', command = 'set cursorline', group = cursorGrp }
)
vim.api.nvim_create_autocmd(
	{ 'InsertEnter', 'WinLeave' },
	{ pattern = '*', command = 'set nocursorline', group = cursorGrp }
)

-- don't auto comment new line
vim.api.nvim_create_autocmd('BufEnter', { command = [[set formatoptions-=cro]] })
