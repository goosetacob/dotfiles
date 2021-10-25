nnoremap <leader>en :lua require'goosetacob.edit_config'.edit('nvim')<CR>
nnoremap <leader>et :lua require'goosetacob.edit_config'.edit('tmux')<CR>
nnoremap <leader>ez :lua require'goosetacob.edit_config'.edit('zsh')<CR>

" sweet notes manages
" tip: <C-e> to create file
nnoremap <leader>et :lua require'goosetacob.edit_config'.edit_notes()<CR>
