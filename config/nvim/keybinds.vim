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


" open filer
nnoremap <silent> sf :<C-u>Defx -listed -resume -toggle
      \ -columns=indent:mark:icon:icons:filename:git:size
      \ -buffer-name=tab`tabpagenr()`
      \ `expand('%:p:h')` -search=`expand('%:p')`<CR>

nnoremap <silent> sl <cmd>Telescope find_files<cr>
nnoremap <silent> sL <cmd>Telescope find_files hidden=true<cr>
nnoremap <silent> sr <cmd>Telescope live_grep<cr>
nnoremap <silent> sb <cmd>Telescope buffers<cr>
nnoremap <silent> s; <cmd>Telescope help_tags<cr>

nnoremap <silent> sg <cmd>IndentGuidesToggle<cr>

nnoremap <silent> gb <cmd>GBrowse<cr>
