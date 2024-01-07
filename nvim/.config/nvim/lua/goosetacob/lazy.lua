local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable', -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require 'lazy'.setup({
	-- lsp
	{
		'VonHeikemen/lsp-zero.nvim',
		dependencies = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },
			{ 'williamboman/mason.nvim' },
			{ 'williamboman/mason-lspconfig.nvim' },
			{ 'jose-elias-alvarez/null-ls.nvim' },
			{ 'jay-babu/mason-null-ls.nvim' },

			-- Useful lsp status updates
			{
				'j-hui/fidget.nvim',
				tag = 'legacy'
			},

			-- Additional lua configuration, makes nvim stuff amazing
			{ 'folke/neodev.nvim' },

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-path' },
			{ 'saadparwaiz1/cmp_luasnip' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-nvim-lua' },

		}
	},

	-- treesitter
	{ 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
	'nvim-treesitter/playground',
	'nvim-treesitter/nvim-treesitter-textobjects',
	-- 'p00f/nvim-ts-rainbow',

	-- telescope
	{
		'nvim-telescope/telescope.nvim',
		-- tag = '0.1.4',
		-- or branch = '0.1.x',
		dependencies = {
			{ 'nvim-lua/plenary.nvim' },
			{ 'nvim-lua/popup.nvim' }
		}
	},
	'nvim-telescope/telescope-fzy-native.nvim',

	-- Snippets
	{
		'L3MON4D3/LuaSnip',
		dependencies = { "rafamadriz/friendly-snippets" },
	},

	-- extra language stuffs
	'simrat39/rust-tools.nvim',

	-- text manipulation
	{
		'numToStr/Comment.nvim',
		dependencies = {
			{ 'JoosepAlviste/nvim-ts-context-commentstring' },
		},
		config = function()
			require 'Comment'.setup({
				pre_hook = require 'ts_context_commentstring.integrations.comment_nvim'.create_pre_hook(),
			})
		end
	},

	-- git stuff
	'tpope/vim-fugitive',
	'tpope/vim-rhubarb',
	'lewis6991/gitsigns.nvim',

	-- nice ui stuff
	'hoob3rt/lualine.nvim',
	'norcalli/nvim-colorizer.lua',
	'airblade/vim-gitgutter',

	-- nice tools / settings
	'mbbill/undotree',
	'sindrets/diffview.nvim',
	'tpope/vim-sensible',
	'tpope/vim-surround',
	'tpope/vim-sleuth',

	-- colors
	{
		'rose-pine/neovim',
		as = 'rose-pine',
		config = function()
			vim.cmd('colorscheme rose-pine')
		end
	},
})
