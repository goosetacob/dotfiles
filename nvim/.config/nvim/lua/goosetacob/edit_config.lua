-- not sure how to get mappins to work in lua right now...
-- mappings are done in corresponding edit_config.vim file
local actions = require 'telescope.actions'
local action_state = require 'telescope.actions.state'

local set_prompt_to_entry_value = function(prompt_bufnr)
	local entry = action_state.get_selected_entry()
	if not entry or not type(entry) == 'table' then return end

	action_state.get_current_picker(prompt_bufnr):reset_prompt(entry.ordinal)
end

local M = {}

function M.edit(target)
	local opts_with_preview, opts_without_preview

	opts_with_preview = {
		prompt_title = '~ ' .. target .. ' config ~',
		shorten_path = false,
		hidden = true,
		cwd = '~/.dotfiles/' .. target .. '/.config/' .. target,

		layout_strategy = 'flex',
		layout_config = {
			width = 0.9,
			height = 0.8,
			horizontal = {width = {padding = 0.0}, preview_width = 0.50},
			vertical = {preview_height = 0.75}
		},

		attach_mappings = function(_, map)
			map('i', '<c-y>', set_prompt_to_entry_value)
			map('i', '<M-c>', function(prompt_bufnr)
				actions.close(prompt_bufnr)
				vim.schedule(function()
					require('telescope.builtin').find_files(opts_without_preview)
				end)
			end)

			return true
		end
	}

	opts_without_preview = vim.deepcopy(opts_with_preview)
	opts_without_preview.previewer = false

	require('telescope.builtin').find_files(opts_with_preview)
end

function M.edit_notes()
	require('telescope.builtin').file_browser({
		prompt_title = '~ notes ~',
		shorten_path = false,
		cwd = '~/Documents/notes',
		hidden = true,
		depth = 0,

		layout_strategy = 'flex',
		layout_config = {
			width = 0.9,
			height = 0.8,
			horizontal = {width = {padding = 0.15}},
			vertical = {preview_height = 0.75}
		}
	})
end

return M
