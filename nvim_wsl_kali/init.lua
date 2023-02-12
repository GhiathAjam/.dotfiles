-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('core.plugins')
require('core.options')
require('core.keymap')
require('core.gui')
require('core.autocmd')
require('core.lsp')
