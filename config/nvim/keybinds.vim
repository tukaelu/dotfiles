" ============================================================================
"  KeyBinding
" ============================================================================

" Reload
nnoremap <C-1> :source $MYVIMRC<cr>

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

nnoremap <silent> ;g <cmd>'<,'>GBrowse<cr>
nnoremap <silent> ;b <cmd>Git blame<cr>
nnoremap <silent> ;d <cmd>Gdiffsplit<cr>
nnoremap <silent> ;v <cmd>IndentGuidesToggle<cr>

nnoremap <silent> ;T <cmd>TroubleToggle<cr>
nnoremap <silent> ;tw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <silent> ;td <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <silent> ;tq <cmd>TroubleToggle quickfix<cr>
nnoremap <silent> ;tl <cmd>TroubleToggle loclist<cr>

nnoremap <silent> ;r <cmd>TroubleToggle lsp_references<cr>
nnoremap <silent> ;d <cmd>TroubleToggle lsp_definitions<cr>
nnoremap <silent> ;t <cmd>TroubleToggle lsp_type_definitions<cr>
