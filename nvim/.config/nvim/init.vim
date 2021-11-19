" Automagically install `vim-plug` if it does not exist
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
	silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('$XDG_DATA_HOME/nvim/plugged')

" lsp
Plug 'neovim/nvim-lspconfig'
Plug 'tjdevries/lsp_extensions.nvim'
Plug 'tjdevries/nlua.nvim'
" Plug 'ray-x/navigator.lua' " looks sweet, but can't figure out setup...

" tree sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'p00f/nvim-ts-rainbow'

" file finding
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" autocomplete
Plug 'hrsh7th/nvim-cmp'
Plug 'onsails/lspkind-nvim'

" autocomplete providers
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'f3fora/cmp-spell'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
" Plug 'norcalli/snippets.nvim'
" Plug 'nvim-lua/completion-nvim'

" status line
Plug 'hoob3rt/lualine.nvim'

" lang file types
Plug 'hashivim/vim-terraform'
Plug 'ekalinin/Dockerfile.vim'
Plug 'evanleck/vim-svelte', {'branch': 'main'}
Plug 'rust-lang/rust.vim'

" debuggers
" Plug 'puremourning/vimspector'
" Plug 'mfussenegger/nvim-dap'

" git things
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" text manipulation
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'

" nicetes
Plug 'mbbill/undotree'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'norcalli/nvim-colorizer.lua'
Plug 'airblade/vim-gitgutter'
" Plug 'nvim-lspinstall'
" Plug 'tpope/vim-scriptease'
" Plug 'phaazon/hop.nvim'

" colors
Plug 'jaredgorski/SpaceCamp'
Plug 'tomasiser/vim-code-dark'

" Initialize plugin system
call plug#end()

lua require("goosetacob")

" Colors
syntax on
" let g:codedark_conservative = 1
" colorscheme codedark
colorscheme spacecamp_lite

" remap : to ;
nnoremap ; :

" set leader key
let g:mapleader=" "

" avoid loading matchparen
let g:loaded_matchparen = 1

" netrw delete
let g:netrw_localrmdir='rm -r'

if executable('rg')
	let g:rg_derive_root='true'
endif

" node.js provider install with yarn1
" let g:node_host_prog='~/.local/share/yarn/global/node_modules/neovim/bin/cli.js'

fun! TrimWhitespace()
	let l:save = winsaveview()
	keeppatterns %s/\s\+$//e
	call winrestview(l:save)
endfun

augroup GANSITO
	" clear things out
	autocmd!
	" cleanup trailing whitespaces
	autocmd BufWritePre * :call TrimWhitespace()
	" format on save
	autocmd BufWritePre * :lua vim.lsp.buf.formatting()
	" inlay hints
	" autocmd CursorHold,CursorHoldI,CursorMoved *.rs :lua require'lsp_extensions'.inlay_hints{}
	" autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require'lsp_extensions'.inlay_hints{}
	" run terraform files through fmt
	" autocmd BufWritePost *.tf !terraform fmt %
	" enable type inlay hints
	" autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost * lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = "Comment", enabled = {"TypeHint", "ChainingHint", "ParameterHint"} }
	" https://vim.fandom.com/wiki/Keep_your_cursor_centered_vertically_on_the_screen#Centering_automatically_with_autocmds
	autocmd BufEnter,WinEnter,WinNew,VimResized *,*.* let &scrolloff=winheight(win_getid())/2
	" lsp document highlighting
	" autocmd CursorHold <buffer> :lua vim.lsp.buf.document_highlight()
	" autocmd CursorMoved <buffer> :lua vim.lsp.buf.clear_references()
augroup END
