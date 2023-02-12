local _1, mark = pcall(require, 'harpoon.mark')
local _2, ui   = pcall(require, 'harpoon.ui')

if not (_1 and _2) then 
  vim.notify('Hey Gh: HARPOOOOOOON NOT HERE')
  return
end

vim.keymap.set('n', '<leader>ha', mark.add_file)
vim.keymap.set('n', '<leader>hg', ui.toggle_quick_menu)

vim.keymap.set('n', '<leader>1', function() ui.nav_file(1) end)
vim.keymap.set('n', '<leader>2', function() ui.nav_file(2) end)
vim.keymap.set('n', '<leader>3', function() ui.nav_file(3) end)
vim.keymap.set('n', '<leader>4', function() ui.nav_file(4) end)
vim.keymap.set('n', '<leader>5', function() ui.nav_file(5) end)
