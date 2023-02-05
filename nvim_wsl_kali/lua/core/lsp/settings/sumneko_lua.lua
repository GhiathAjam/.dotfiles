local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

require('neodev').setup {
  library = {
    enabled = true, -- when not enabled, neodev will not change any settings to the LSP server
    -- these settings will be used for your Neovim config directory
    runtime = true, -- runtime path
    types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
    plugins = true, -- installed opt or start plugins in packpath
    -- you can also specify the list of plugins to make available as a workspace library
    -- plugins = { "nvim-treesitter", "plenary.nvim", "telescope.nvim" },
  },
  setup_jsonls = true, -- configures jsonls to provide completion for project specific .luarc.json files
  -- for your Neovim config directory, the config.library settings will be used as is
  -- for plugin directories (root_dirs having a /lua directory), config.library.plugins will be disabled
  -- for any other directory, config.library.enabled will be set to false
  override = function(root_dir, options) end,
  -- With lspconfig, Neodev will automatically setup your lua-language-server
  -- If you disable this, then you have to set {before_init=require("neodev.lsp").before_init}
  -- in your lsp start options
  lspconfig = true,
  -- much faster, but needs a recent built of lua-language-server
  -- needs lua-language-server >= 3.6.0
  pathStrict = true,
}

return {
	settings = {

		Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        -- path = runtime_path,
      },
			diagnostics = {
        -- Get the language server to recognize the `vim` global
				globals = { 'vim' },
			},
			workspace = {
				library = {
					[vim.fn.expand('$VIMRUNTIME/lua')] = true,
					[vim.fn.stdpath('config') .. '/lua'] = true,
				},
        checkThirdParty = false, -- THIS IS THE IMPORTANT LINE TO ADD
			},
      telemetry = {
        enable = false,
      },
      -- neodev!
      completion = {
        callSnippet = "Replace"
      },
		},
	},
}
