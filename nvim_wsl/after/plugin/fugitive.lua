local ok = packer_plugins['vim-fugitive'] and packer_plugins['vim-fugitive'].loaded
if not ok then
  vim.notify('vim-fugitive plugin not found', vim.log.levels.WARN)
  return
end

-- vim.keymap.set('n', '<leader>gs', vim.cmd.Git, vim.g.map_opt)
