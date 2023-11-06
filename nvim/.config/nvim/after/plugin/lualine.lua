require 'lualine'.setup {
		options = {
				theme = 'rose-pine',
				icons_enabled = false,
				section_separators = '',
				component_separators = '',
				globalstatus = true,
		},
		sections = {
				lualine_a = { 'mode' },
				lualine_b = { 'branch' },
				lualine_c = {
						{
								'filename',
								file_status = true, -- displays file status (readonly status, modified status)
								path = 2 -- absolute path
						}
				},
				lualine_x = { 'encoding', 'fileformat', 'filetype' },
				lualine_y = { 'progress' },
				lualine_z = { 'location' }
		},
		inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {
						{
								'filename',
								file_status = true, -- displays file status (readonly status, modified status)
								path = 2 -- absolute path
						}
				},
				lualine_x = { 'location' },
				lualine_y = {},
				lualine_z = {}
		},
		extensions = { 'fugitive' }
}
