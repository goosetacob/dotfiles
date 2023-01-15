-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	is_bootstrap = true
	vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
	vim.cmd [[packadd packer.nvim]]
end

require 'packer'.startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- lsp
	use {
		'VonHeikemen/lsp-zero.nvim',
		requires = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },
			{ 'williamboman/mason.nvim' },
			{ 'williamboman/mason-lspconfig.nvim' },
			{ 'jose-elias-alvarez/null-ls.nvim' },
			{ 'jay-babu/mason-null-ls.nvim' },

			-- Useful lsp status updates
			{ 'j-hui/fidget.nvim' },

			-- Additional lua configuration, makes nvim stuff amazing
			{ 'folke/neodev.nvim' },

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-path' },
			{ 'saadparwaiz1/cmp_luasnip' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-nvim-lua' },

			-- Snippets
			{ 'L3MON4D3/LuaSnip' },
			{ 'rafamadriz/friendly-snippets' },
		}
	}

	-- treesitter
	use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
	use('nvim-treesitter/playground')
	use('nvim-treesitter/nvim-treesitter-textobjects')
	use('p00f/nvim-ts-rainbow')

	-- telescope
	use {
		'nvim-telescope/telescope.nvim',
		tag = '0.1.0',
		-- or branch = '0.1.x',
		requires = {
			{ 'nvim-lua/plenary.nvim' },
			{ 'nvim-lua/popup.nvim' }
		}
	}
	use('nvim-telescope/telescope-fzy-native.nvim')

	-- extra language stuffs
	use('simrat39/rust-tools.nvim')

	-- text manipulation
	use {
		'numToStr/Comment.nvim',
		requires = {
			{ 'JoosepAlviste/nvim-ts-context-commentstring' },
		},
		config = function()
			require 'Comment'.setup({
				pre_hook = require 'ts_context_commentstring.integrations.comment_nvim'.create_pre_hook(),
			})
		end
	}

	-- git stuff
	use('tpope/vim-fugitive')
	use('tpope/vim-rhubarb')
	use('lewis6991/gitsigns.nvim')

	-- nice ui stuff
	use('hoob3rt/lualine.nvim')
	use('norcalli/nvim-colorizer.lua')
	use('airblade/vim-gitgutter')

	-- nice tools / settings
	use('mbbill/undotree')
	use('tpope/vim-sensible')
	use('tpope/vim-surround')
	use('tpope/vim-sleuth')

	-- extra stuff from vimscript config
	-- not sure if i need it?
	-- Plug 'ray-x/navigator.lua' " looks sweet, but can't figure out setup...
	-- Plug 'ekalinin/Dockerfile.vim'
	-- Plug 'evanleck/vim-svelte', {'branch': 'main'}
	-- Plug 'rust-lang/rust.vim'

	-- colors
	use({
		'rose-pine/neovim',
		as = 'rose-pine',
		config = function()
			vim.cmd('colorscheme rose-pine')
		end
	})

	if is_bootstrap then
		require 'packer'.sync()
	end
end)

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
	print '=================================='
	print '    Plugins are being installed'
	print '    Wait until Packer completes,'
	print '       then restart nvim'
	print '=================================='
	return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
	command = 'source <afile> | silent! LspStop | silent! LspStart | PackerCompile',
	group = packer_group,
	pattern = vim.fn.expand '$MYVIMRC',
})
