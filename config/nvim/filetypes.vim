" ============================================================================
"  FileType settings
" ============================================================================

" Golang
au BufNewFile,BufRead *.go setf go
" TypeScript
au BufNewFile,BufRead *.tsx setf typescriptreact
" Markdown
au BufNewFile,BufRead *.md setf markdown
" Markdown React
au BufNewFile,BufRead *mdx setf markdownreact

set suffixesadd=.js,.es,.jsx,.json,.css,.less,.sass,.styl,.php,.py,.md

autocmd FileType json setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
