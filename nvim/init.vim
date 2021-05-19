" Automagically install `vim-plug` if it does not exist
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.config/nvim/plugged')

" lsp
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'tjdevries/lsp_extensions.nvim'
Plug 'tjdevries/nlua.nvim'

" tree sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'norcalli/snippets.nvim'

" file finding
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" status line
Plug 'hoob3rt/lualine.nvim'

" lang file types
Plug 'hashivim/vim-terraform'
Plug 'evanleck/vim-svelte', {'branch': 'main'}
Plug 'rust-lang/rust.vim'
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

" debuggers
Plug 'puremourning/vimspector'

" text manipulation
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'

" nicetes
Plug 'mbbill/undotree'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'norcalli/nvim-colorizer.lua'

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
let mapleader=" "

if executable('rg')
    let g:rg_derive_root='true'
endif

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
    " inlay hints
    " autocmd CursorHold,CursorHoldI,CursorMoved *.rs :lua require'lsp_extensions'.inlay_hints{}
    " autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require'lsp_extensions'.inlay_hints{}
    " format on save
    " autocmd BufWritePre * :lua vim.lsp.buf.formatting_sync(nil, 1000)
    " spell checking and text wrapping for commits
    autocmd Filetype gitcommit setlocal spell textwidth=72
    " run terraform files through fmt
    " autocmd BufWritePost *.tf !terraform fmt %
	" enable type inlay hints
	autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost * lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = "Comment", enabled = {"TypeHint", "ChainingHint", "ParameterHint"} }
	" https://vim.fandom.com/wiki/Keep_your_cursor_centered_vertically_on_the_screen#Centering_automatically_with_autocmds
	autocmd BufEnter,WinEnter,WinNew,VimResized *,*.* let &scrolloff=winheight(win_getid())/2
augroup END
