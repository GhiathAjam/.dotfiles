-- align
vim.keymap.set('n', 'ga', '<Plug>(EasyAlign)')
vim.keymap.set('x', 'ga', '<Plug>(EasyAlign)')

-- Default:
--   If a delimiter is in a highlight group whose name matches
--   any of the followings, it will be ignored.
vim.g.easy_align_ignore_groups = { 'Comment', 'String' }

