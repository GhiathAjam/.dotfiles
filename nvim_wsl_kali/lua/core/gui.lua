if not vim.g.neovide then
  return
end

-- Put anything you want to happen only in Neovide here

-- FONT
vim.cmd [[ set guifont=CaskaydiaCove_NFM:h11 ]]
-- vim.cmd [[ set guifont=Consolas:h14 ]]
-- vim.cmd [[ set guifont=Source_Code_Pro:h14 ]]

-- LINESPACE
vim.opt.linespace = 5
-- vim.g.neovide_scale_factor = 1.0

local myg = vim.api.nvim_create_augroup('neovide', { clear = true })
vim.api.nvim_clear_autocmds({ group = myg })

-- -- Directory
-- vim.api.nvim_create_autocmd('VimEnter', {
--   group = myg,
--   callback = function()
--     vim.defer_fn(function()
--       vim.cmd.cd('~')
--       local p = os.getenv('HOME')
--       -- local p = os.getenv('HOME') .. '/.config/nvim'
--       vim.cmd.e(p)
--     end, 1)
--   end
-- })

-- Floating Blur
vim.g.neovide_floating_blur_amount_x = 22.0
vim.g.neovide_floating_blur_amount_y = 22.0

-- Transparency
-- 0 is fully transparent, 1 is fully opaque
vim.g.neovide_transparency = 1.0

-- Scroll Animation Length
-- vim.g.neovide_scroll_animation_length = 0.3

-- Hiding the mouse when typing
-- vim.g.neovide_hide_mouse_when_typing = false
