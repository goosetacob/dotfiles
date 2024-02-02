return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-fzy-native.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local sorters = require("telescope.sorters")
		local previewers = require("telescope.previewers")
		local builtin = require("telescope.builtin")

		telescope.setup({
			defaults = {
				file_sorter = sorters.get_fzy_sorter,
				prompt_prefix = " >",
				color_devicons = true,
				file_ignore_patterns = { "node_modules/*", "%.env" },
				file_previewer = previewers.vim_buffer_cat.new,
				grep_previewer = previewers.vim_buffer_vimgrep.new,
				qflist_previewer = previewers.vim_buffer_qflist.new,
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
					},
				},
			},
			extensions = {
				fzy_native = {
					override_generic_sorter = false,
					override_file_sorter = true,
				},
			},
		})

		telescope.load_extension("fzy_native")

		vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Open [p]roject git files" })
		vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Open [p]roject [f]iles" })
		vim.keymap.set("n", "<leader>ph", builtin.help_tags, { desc = "Open [p]roject [h]elp tags" })
		vim.keymap.set("n", "<leader>pb", builtin.buffers, { desc = "Open [p]roject [b]uffers" })
		vim.keymap.set("n", "<leader>pw", function()
			builtin.grep_string({ search = vim.fn.expand("<cword>") })
		end, { desc = "Search for [p]roject [w]ord" })
		vim.keymap.set("n", "<leader>ps", function()
			builtin.grep_string({ search = vim.fn.input({ prompt = "grep string > " }), use_regex = true })
		end, { desc = "Search for [p]roject [s]tring" })
	end,
}
