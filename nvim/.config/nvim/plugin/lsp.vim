" Set updatetime for CursorHold
" 200ms of no cursor movement to trigger CursorHold
set updatetime=600

" Show diagnostic popup on cursor hold
" autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics({ focusable = false })
" autocmd CursorHold * lua vim.diagnostic.open_float()
" autocmd CursorHoldI * silent! lua vim.lsp.buf.signature_help()

" lsp keymaps
nnoremap K :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>gd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>gtd :lua vim.lsp.buf.type_definition()<CR>
nnoremap <leader>gi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>gr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>grn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>gca :lua vim.lsp.buf.code_action()<CR>

" diagnostic keymaps
nnoremap <leader>dj vim.diagnostic.goto_next()<CR>
nnoremap <leader>dk vim.diagnostic.goto_prev()<CR>
nnoremap <leader>dl Telescope diagnostics<CR>

" formatting
nnoremap <leader>ff :lua vim.lsp.buf.formatting_sync()<CR>
