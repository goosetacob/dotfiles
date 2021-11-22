" Set updatetime for CursorHold
" 200ms of no cursor movement to trigger CursorHold
set updatetime=600

" Show diagnostic popup on cursor hold
autocmd CursorHold * lua require'lspsaga.diagnostic'.show_line_diagnostics()

" Code navigation shortcuts
" nnoremap <leader>gd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>gd :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>gi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>gr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>grn :lua require'lspsaga.rename'.rename()<CR>
" nnoremap <leader>grn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>gca :lua require'lspsaga.codeaction'.code_action()<CR>
" nnoremap <leader>gca :lua vim.lsp.buf.code_action()<CR>

" manually format
nnoremap <leader>ff :lua vim.lsp.buf.formatting()<CR>
xnoremap <leader>ff :lua vim.lsp.buf.range_formatting()<CR>
