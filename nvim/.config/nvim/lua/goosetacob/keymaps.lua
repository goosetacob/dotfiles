vim.keymap.set('n', ';', ':')

vim.keymap.set('n', '<leader>pv', '<cmd>Vex 25<CR>', { desc = 'Open file explorer' })

vim.keymap.set('n', '<leader><leader>', function()
	local notesFilename = os.getenv('XDG_DATA_HOME') .. '/notes.md'
	local bufferFilename = vim.fn.expand('%')
	if (notesFilename == bufferFilename) then
		vim.cmd.write()
		vim.cmd.bdelete()
	else
		vim.cmd.edit(notesFilename)
	end
end, { desc = 'Toggle notes buffer' })

-- navigate buffers
vim.keymap.set('n', '[b', vim.cmd.bprevious, { desc = 'Previous buffer' })
vim.keymap.set('n', ']b', vim.cmd.bnext, { desc = 'Next buffer' })

-- when move visual block up/down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- don't move cursor when appendind bottom line
vim.keymap.set('n', 'J', 'mzJ`z')

-- keep search terms cetered
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- delete without overwritting prev yanked string
vim.keymap.set('x', '<leader>p', [["_dP]])
vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]])

-- sure?
-- vim.keymap.set('n', 'Q', '<nop>')

-- qflist stuffs
vim.keymap.set('n', '<C-j>', '<cmd>cnext<CR>')
vim.keymap.set('n', '<C-k>', '<cmd>cprev<CR>')

-- regex replace the word cursor is on
vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
