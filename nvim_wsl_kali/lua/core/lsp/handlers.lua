local M = {}

-- TODO: backfill this to template
M.setup = function()
  local signs = {
    { name = 'DiagnosticSignError1', text = '' },
    { name = 'DiagnosticSignWarn1', text = '' },
    { name = 'DiagnosticSignHint1', text = '' },
    { name = 'DiagnosticSignInfo1', text = '' },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = '' })
  end

  local config = {
    -- virrual text only if error!
    virtual_text = {
      severity = vim.diagnostic.severity.ERROR,
    },
    -- show signs
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
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

  vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = 'rounded',
  })

  vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = 'rounded',
  })
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
  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- Enable completion triggered by <c-x><c-o>
  -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  -- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  -- vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, opts)
  -- vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)

-- See `:help vim.diagnostic.*` for documentation on any of the below functions
  vim.keymap.set('n', '<leader>gl', vim.diagnostic.open_float, opts)
  vim.keymap.set('n', '[d', function() vim.diagnostic.goto_prev({ border = 'rounded' }) end, opts)
  vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next({ border = 'rounded' }) end, opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>q', vim.diagnostic.setloclist, opts)

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format({ async = true })
  end, { desc = 'Format current buffer with LSP' })

  -- map('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  -- map('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  -- map('n', '<space>wl', function()
    -- print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end

M.on_attach = function(client, bufnr)
  if client.name == 'tsserver' then
    client.server_capabilities.documentFormattingProvider = false
  end
  lsp_keymaps(bufnr)
  lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not status_ok then
  vim.notify('××××××cmp_nvim_lsp doesn\'t exist')
  return
end
M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
M.capabilities.offsetEncoding = 'utf-8'

-- local status_ok, coq = pcall(require, 'coq')
-- if not status_ok then
--   vim.notify('××××××coq doesn\'t exist')
--   return
-- end
-- M.capabilities = coq.lsp_ensure_capabilities(capabilities)
-- M.capabilities.offsetEncoding = 'utf-8'

return M
