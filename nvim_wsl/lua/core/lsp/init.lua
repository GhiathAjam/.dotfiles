local status_ok, _ = pcall(require, 'lspconfig')
if not status_ok then
  return
end

-- print('lsp goes brr')

require 'core.lsp.mason'
require('core.lsp.handlers').setup()
-- require 'core.lsp.null-ls'
