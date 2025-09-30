return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
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
				file_ignore_patterns = { "node_modules/*", "%.env", "_build/*" },
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
			pickers = {
				find_files = {
					theme = "ivy",
				},
				git_files = {
					theme = "ivy",
				},
				grep_string = {
					theme = "ivy",
				},
			},
			extensions = {
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					-- the default case_mode is "smart_case"
				},
			},
		})

		telescope.load_extension("fzf")

		vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Open [p]roject git files" })
		vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Open [p]roject [f]iles" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [h]elp tags" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[F]ind [b]uffers" })
		vim.keymap.set("n", "<leader>fw", function()
			builtin.grep_string({ search = vim.fn.expand("<cword>") })
		end, { desc = "[F]ind [w]ord" })
		vim.keymap.set("n", "<leader>fg", require("goosetacob.custom_fn").multi_rg, { desc = "[F]ind [g]rep" })
	end,
}
