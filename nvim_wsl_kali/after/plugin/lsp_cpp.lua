return

local lspconfig = require 'lspconfig'
local coq = require 'coq'


local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}


-- coq = require 'coq'
local ccls_conf = {
    on_attach = Lsp_on_attach,
    flags = lsp_flags,
    offset_encoding = 'utf-8',
    -- root_dir = [[root_pattern('compile_commands.json', '.ccls', '.git')]],
    init_options = {
      -- compilationDatabaseDirectory = "build";
      -- index = {
      --   threads = 0;
      -- };
      cache = {
        directory = ".ccls-cache";
      };
      clang = {
        excludeArgs = { "-frounding-math", "-Wconversion" } ;
      };
    }
}

lspconfig.ccls.setup(coq.lsp_ensure_capabilities(ccls_conf))
