
"" see https://zenn.dev/ryo_kawamata/articles/improve-neovmi-terminal
" ESCでインサートモードを抜ける
:tnoremap <Esc> <C-\><C-n>
" :T で画面下部にターミナルを表示
command! -nargs=* T split | wincmd j | resize 20 | terminal <args>
" インサートモードでターミナルを開く
autocmd TermOpen * startinsert

