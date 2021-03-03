require('telescope').setup {
	defaults = {
		file_sorter = require('telescope.sorters').get_fzy_sorter,
		prompt_prefix = ' >',
		color_devicons = true,
		file_ignore_patterns = {
			"node_modules/*",
			"scratch/.*",
			"%.env"
		}
	},
	extensions = {
		fzy_native = {
			override_generic_sorter = false,
			override_file_sorter = true,
		}
	}
}

require('telescope').load_extension('fzy_native')
