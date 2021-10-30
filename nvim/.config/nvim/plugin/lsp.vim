" Set updatetime for CursorHold
" 200ms of no cursor movement to trigger CursorHold
set updatetime=600

" Show diagnostic popup on cursor hold
autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()
autocmd CursorHoldI * silent! lua vim.lsp.buf.signature_help()

" Code navigation shortcuts
" nnoremap <leader>gd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>gd :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>gi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>gr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>grn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>gca :lua vim.lsp.buf.code_action()<CR>
