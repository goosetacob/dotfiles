vim.keymap.set('n', '<leader>gl', vim.cmd.GBrowse)
vim.keymap.set('v', '<leader>gl', function()
	vim.cmd([['<,'>GBrowse]])
end)

require 'gitsigns'.setup {
	signs = {
		add = { text = '+' },
		change = { text = '~' },
		delete = { text = '_' },
		topdelete = { text = '‾' },
		changedelete = { text = '~' },
	},
}
