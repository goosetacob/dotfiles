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
Plug 'tjdevries/nlua.nvim'
Plug 'tjdevries/lsp_extensions.nvim'

" tree sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" file finding
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" status line
Plug 'vim-airline/vim-airline'

" debuggers
Plug 'puremourning/vimspector'
Plug 'szw/vim-maximizer'

" misc tools
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" lang file types
Plug 'evanleck/vim-svelte'
" Plug 'rust-lang/rust.vim'
" Plug 'hashivim/vim-terraform'
" theme

Plug 'NLKNguyen/papercolor-theme'

" Initialize plugin system
call plug#end()

" remap : to ;
nnoremap ; :

" set leader key
let mapleader=" "

syntax on
colorscheme papercolor

if executable('rg')
    let g:rg_derive_root='true'
endif

" tree sitter
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }

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
    autocmd BufEnter,BufWinEnter,TabEnter *.js,*.ts,*.svelte :lua require'lsp_extensions'.inlay_hints{}
    " format on save
    autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()
    " spell checking and text wrapping for commits
    autocmd Filetype gitcommit setlocal spell textwidth=72
    " run terraform files through fmt
    " autocmd BufWritePost *.tf !terraform fmt %
augroup END
