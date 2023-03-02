local ok1, mark = pcall(require, 'harpoon.mark')
local ok2, ui   = pcall(require, 'harpoon.ui')

if not (ok1 and ok2) then
  vim.notify('harpoon plugin not found', vim.log.levels.WARN)
  return
end

vim.keymap.set('n', '<leader>ha', mark.add_file)
vim.keymap.set('n', '<leader>hg', ui.toggle_quick_menu)

vim.keymap.set('n', '<leader>1', function() ui.nav_file(1) end)
vim.keymap.set('n', '<leader>2', function() ui.nav_file(2) end)
vim.keymap.set('n', '<leader>3', function() ui.nav_file(3) end)
vim.keymap.set('n', '<leader>4', function() ui.nav_file(4) end)
vim.keymap.set('n', '<leader>5', function() ui.nav_file(5) end)
