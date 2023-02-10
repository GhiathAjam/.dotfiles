-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('core.plugins')
require('core.options')
require('core.keymap')
require('core.autocmd')
require('core.lsp')

-- let g:vimspector_code_minwidth = 70
-- let g:vimspector_terminal_minwidth = 27
-- let g:vimspector_sidebar_width = 42

if vim.g.neovide then
  -- Put anything you want to happen only in Neovide here
  -- vim.cmd [[ cd ~ ]]
  vim.cmd [[ cd ~/.config/nvim | e init.lua ]]

  -- FONT
  vim.cmd [[ set guifont=CaskaydiaCove_NFM:h11 ]]
  -- vim.cmd [[ set guifont=Consolas:h14 ]]
  -- vim.cmd [[ set guifont=Source_Code_Pro:h14 ]]

  -- LINESPACE
  vim.opt.linespace = 1
  vim.g.neovide_scale_factor = 1.0

  -- Floating Blur
  -- vim.g.neovide_floating_blur_amount_x = 2.0
  -- vim.g.neovide_floating_blur_amount_y = 2.0

  -- Transparency
  -- vim.g.neovide_transparency = 0.8

  -- Scroll Animation Length
  -- vim.g.neovide_scroll_animation_length = 0.3

  -- Hiding the mouse when typing
  -- vim.g.neovide_hide_mouse_when_typing = false
end
