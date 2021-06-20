set completeopt=menuone,noinsert,noselect

" possible value: 'UltiSnips', 'Neosnippet', 'vim-vsnip', 'snippets.nvim'
let g:completion_enable_snippet = 'snippets.nvim'
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" use <Tab> as trigger keys
imap <Tab> <Plug>(completion_smart_tab)
imap <S-Tab> <Plug>(completion_smart_s_tab)

" Code navigation shortcuts
nnoremap <leader>gd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>gi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>gr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>grn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>gh :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>gca :lua vim.lsp.buf.code_action()<CR>

" Set updatetime for CursorHold
" 200ms of no cursor movement to trigger CursorHold
set updatetime=600
" Show diagnostic popup on cursor hold
autocmd CursorHold *.* lua vim.lsp.diagnostic.show_line_diagnostics({show_header = false, focusable = false})
autocmd CursorHoldI * silent! lua vim.lsp.buf.signature_help()
" Goto previous/next diagnostic warning/error
nnoremap <silent> g[ :lua vim.lsp.diagnostic.goto_prev({ enable_popup = false })<CR>
nnoremap <silent> g] :lua vim.lsp.diagnostic.goto_next({ enable_popup = false })<CR>
