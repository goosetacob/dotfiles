local telescope = require 'telescope'
local actions = require 'telescope.actions'
local sorters = require 'telescope.sorters'
local previewers = require 'telescope.previewers'

telescope.setup {
	defaults = {
		file_sorter = sorters.get_fzy_sorter,
		prompt_prefix = ' >',
		color_devicons = true,
		file_ignore_patterns = {'node_modules/*', '%.env'},
		file_previewer = previewers.vim_buffer_cat.new,
		grep_previewer = previewers.vim_buffer_vimgrep.new,
		qflist_previewer = previewers.vim_buffer_qflist.new,
		mappings = {i = {['<C-q>'] = actions.send_to_qflist}}
	},
	extensions = {
		fzy_native = {override_generic_sorter = false, override_file_sorter = true}
	}
}

telescope.load_extension('fzy_native')
