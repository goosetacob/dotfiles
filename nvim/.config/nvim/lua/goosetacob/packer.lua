-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		-- or                            , branch = '0.1.x',
		requires = {
			{ 'nvim-lua/plenary.nvim' },
			{ 'nvim-lua/popup.nvim' }
		}
	}
	use('nvim-telescope/telescope-fzy-native.nvim')

	use({
		'rose-pine/neovim',
		as = 'rose-pine',
		config = function()
			vim.cmd('colorscheme rose-pine')
		end
	})

	use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
	use('nvim-treesitter/playground')

	use('mbbill/undotree')
	use('tpope/vim-fugitive')
	use('hoob3rt/lualine.nvim')

	-- text manipulation
	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup({
				pre_hook = function(ctx)
					-- Only calculate commentstring for tsx filetypes
					if vim.bo.filetype == 'typescriptreact' then
						local U = require('Comment.utils')

						-- Detemine whether to use linewise or blockwise commentstring
						local type = ctx.ctype == U.ctype.line and '__default' or '__multiline'

						-- Determine the location where to calculate commentstring from
						local location = nil
						if ctx.ctype == U.ctype.block then
							location = require('ts_context_commentstring.utils').get_cursor_location()
						elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
							location =
							require('ts_context_commentstring.utils').get_visual_start_location()
						end

						return require('ts_context_commentstring.internal').calculate_commentstring({
							key = type,
							location = location
						})
					end
				end
			})
		end
	}
	use('JoosepAlviste/nvim-ts-context-commentstring')
	use('tpope/vim-sensible')
	use('tpope/vim-surround')
	use('tpope/vim-rhubarb')

	use {
		'VonHeikemen/lsp-zero.nvim',
		requires = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },
			{ 'williamboman/mason.nvim' },
			{ 'williamboman/mason-lspconfig.nvim' },
			{ 'jose-elias-alvarez/null-ls.nvim' },
			{ 'jay-babu/mason-null-ls.nvim' },

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

	-- rando nice stuff
	use('norcalli/nvim-colorizer.lua')
	use('airblade/vim-gitgutter')
end)
