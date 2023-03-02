local ok = packer_plugins['undotree'] and packer_plugins['undotree'].loaded
if not ok then
  vim.notify('undotree plugin not found', vim.log.levels.WARN)
  return
end

vim.keymap.set('n', '<leader>ut', vim.cmd.UndotreeToggle)

