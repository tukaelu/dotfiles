local status, choosewin = pcall(require, 'choosewin')
if (not status) then return end

vim.keymap.set('n', '-', ':ChooseWin<CR>')
