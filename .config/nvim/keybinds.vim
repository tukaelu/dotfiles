" ============================================================================
"  KeyBinding
" ============================================================================

" Save
inoremap <C-s> <C-O>:update<cr>
nnoremap <C-s> :update<cr>

" Windows split
nnoremap _     <ESC>:sp<CR>
nnoremap <bar> <ESC>:vsp<CR>

" Tab control
nnoremap T <ESC>:tabnew<CR>
nnoremap < gT
nnoremap > gt
nnoremap ;q <ESC>:q<CR>

" omnifunc
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>
