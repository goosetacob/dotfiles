local on_attach = require'completion'.on_attach

-- https://github.com/neovim/nvim-lspconfig/tree/master/lua/lspconfig
require'lspconfig'.tsserver.setup{ on_attach=require'completion'.on_attach }
require'lspconfig'.gopls.setup{ on_attach=require'completion'.on_attach }
require'lspconfig'.svelte.setup{ on_attach=require'completion'.on_attach }
require'lspconfig'.pyls.setup{ on_attach=require'completion'.on_attach }
require'lspconfig'.rust_analyzer.setup{ on_attach=require'completion'.on_attach }
