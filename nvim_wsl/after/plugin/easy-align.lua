local ok = packer_plugins['vim-easy-align'] and packer_plugins['vim-easy-align'].loaded
if not ok then
  vim.notify('EasyAlign plugin not found', vim.log.levels.WARN)
  return
end

-- Default:
--   If a delimiter is in a highlight group whose name matches
--   any of the followings, it will be ignored.

vim.g.easy_align_ignore_groups = { 'Comment', 'String' }
vim.keymap.set('n', 'ga', '<Plug>(EasyAlign)', vim.g.map_opt)
vim.keymap.set('x', 'ga', '<Plug>(EasyAlign)', vim.g.map_opt)
