local M = {}

vim.fn.sign_define('DiagnosticSignError',
  { text = vim.g.lsp_signs.Error, texthl = 'DiagnosticSignError' })
vim.fn.sign_define('DiagnosticSignWarn',
  { text = vim.g.lsp_signs.Warning, texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignInfo',
  { text = vim.g.lsp_signs.Information, texthl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignHint',
  { text = vim.g.lsp_signs.Hint, texthl = 'DiagnosticSignHint' })

-- TODO: backfill this to template
M.setup = function()
  local config = {
    -- virrual text only if error!
    virtual_text = true,
    -- virtual_text = {
    --   severity = vim.diagnostic.severity.ERROR,
    -- },
    update_in_insert = true,
    underline = false,
    severity_sort = true,
    float = {
      focusable = false,
      style = 'minimal',
      border = 'rounded',
      source = 'always',
      header = '',
      prefix = '',
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers['textDocument/hover'] =
      vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded', })

  vim.lsp.handlers['textDocument/signatureHelp'] =
      vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded', })
end

local function lsp_highlight_document(client)
  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.documentHighlight then
    vim.api.nvim_exec(
      [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
      false
    )
  end
end

local function lsp_keymaps(bufnr)
  -- Enable completion triggered by <c-x><c-o>
  -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, vim.g.map_buffer_opt)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, vim.g.map_buffer_opt)
  -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, vim.g.map_buffer_opt)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, vim.g.map_buffer_opt)
  -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, vim.g.map_buffer_opt)
  -- vim.api.nvim_buf_create_user_command(bufnr, 'Rename', 'lua vim.lsp.buf.rename()',
  --   { desc = 'Rename symbol with LSP' })
  vim.keymap.set('n', 'gR', vim.lsp.buf.rename, vim.g.map_buffer_opt)
  if pcall(require, 'telescope') then
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, vim.g.map_buffer_opt)
  else
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, vim.g.map_buffer_opt)
  end
  -- vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, vim.g.map_buffer_opt)

  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  vim.keymap.set('n', '<leader>gl', vim.diagnostic.open_float, vim.g.map_buffer_opt)
  vim.keymap.set('n', '[d', function() vim.diagnostic.goto_prev({ border = 'rounded' }) end, vim.g.map_buffer_opt)
  vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next({ border = 'rounded' }) end, vim.g.map_buffer_opt)
  -- map('n', '<space>q', vim.diagnostic.setloclist, opt)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>q', vim.diagnostic.setloclist, vim.g.map_buffer_opt)

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format({ async = true })
  end, { desc = 'Format current buffer with LSP' })

  -- map('n', '<space>wa', vim.lsp.buf.add_workspace_folder, vim.g.map_buffer_opt)
  -- map('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, vim.g.map_buffer_opt)
  -- map('n', '<space>wl', function()
  -- print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end

M.on_attach = function(client, bufnr)
  -- if client.name == 'tsserver' then
  --   client.server_capabilities.documentFormattingProvider = false
  -- end
  lsp_keymaps(bufnr)
  lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not ok then
  vim.notify('cmp_nvim_lsp plugin not found', vim.log.levels.WARN)
  return
end
M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
M.capabilities.offsetEncoding = 'utf-8'

-- local ok, coq = pcall(require, 'coq')
-- if not ok then
--   vim.notify('coq plugin not found', vim.log.levels.WARN)
--   return
-- end
-- M.capabilities = coq.lsp_ensure_capabilities(capabilities)
-- M.capabilities.offsetEncoding = 'utf-8'

return M
