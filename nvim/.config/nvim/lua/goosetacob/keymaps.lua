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

-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- keep search terms cetered
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- delete without overwritting prev yanked string
vim.keymap.set('x', '<leader>p', [["_dP]])
vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]])

-- copy into clipboard?
-- vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
-- vim.keymap.set("n", "<leader>Y", [["+Y]])

-- sure?
vim.keymap.set('n', 'Q', '<nop>')

-- not sure yet
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- qflist stuffs
vim.keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz')
vim.keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz')
vim.keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz')
vim.keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz')

-- regex replace the word cursor is on
vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- get by with C-w?
-- vim.keymap.set("n", "<leader>h", "<cmd>wincmd h<CR>")
-- vim.keymap.set("n", "<leader>j", "<cmd>wincmd j<CR>")
-- vim.keymap.set("n", "<leader>k", "<cmd>wincmd k<CR>")
-- vim.keymap.set("n", "<leader>l", "<cmd>wincmd l<CR>")
