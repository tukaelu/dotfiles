" fzf
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --line-number --no-heading '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'options': '--exact --reverse'}, 'right:50%:wrap'))

nnoremap <silent> ;f <ESC>:FZF<CR>
nnoremap <silent> ;d <ESC>:Buffers<CR>
nnoremap <silent> ;s <ESC>:Rg!<CR>
nnoremap <silent> ;w <ESC>:Windows<CR>
nnoremap <silent> ;h <ESC>:History/<CR>
nnoremap <silent> ;a <ESC>:Snippets<CR>
