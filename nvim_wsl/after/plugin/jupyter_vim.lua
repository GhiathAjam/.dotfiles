local ok = packer_plugins['jupyter-vim'] and packer_plugins['jupyter-vim'].loaded
if not ok then
  vim.notify('jupyter-vim plugin not found', vim.log.levels.WARN)
  return
end

vim.g.jupyter_mapkeys = 0


vim.g.localleader = ","

local opt = vim.g.map_buffer_opt
local map = vim.keymap.set

-- map function after jupyter connection
JupyterKeyMap = function ()
  -- file
  map('n', '<localleader>R', ':JupyterRunFile<CR>', opt)
  -- cell
  map('n', '<localleader>r', ':JupyterRunCell<CR>', opt)
  --  line
  map('n', '<localleader>e', ':JupyterSendRange<CR>', opt)
  -- selection
  map('v', '<localleader>e', ':JupyterRunVisual<CR>', opt)

end

JupyterInit = function()
  -- open :term in a split and run cmd `jupyter console`
  vim.cmd('vsplit | term jupyter console')
  -- go back to previous window
  vim.cmd('wincmd p')
  -- connect to jupyter
  vim.cmd('JupyterConnect')
  --
  vim.notify('Jupyter connection established', vim.log.levels.INFO)
  -- map keys
  JupyterKeyMap()
end

-- set user command :JupyterInit
vim.cmd('command! JupyterInit lua JupyterInit()')

-- " Run current file
-- nnoremap <buffer> <silent> <localleader>R :JupyterRunFile<CR>
-- nnoremap <buffer> <silent> <localleader>I :PythonImportThisFile<CR>
--
-- " Change to directory of current file
-- nnoremap <buffer> <silent> <localleader>d :JupyterCd %:p:h<CR>
--
-- " Send a selection of lines
-- nnoremap <buffer> <silent> <localleader>X :JupyterSendCell<CR>
-- nnoremap <buffer> <silent> <localleader>E :JupyterSendRange<CR>
-- nmap     <buffer> <silent> <localleader>e <Plug>JupyterRunTextObj
-- vmap     <buffer> <silent> <localleader>e <Plug>JupyterRunVisual
--
-- " Debugging maps
-- nnoremap <buffer> <silent> <localleader>b :PythonSetBreak<CR>
