local ok, mason = pcall(require, 'mason')
if not ok then
  vim.notify('mason plugin not found', vim.log.levels.WARN)
  return
end

local ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not ok then
  vim.notify('mason-lspconfig plugin not found', vim.log.levels.WARN)
  return
end

local ok, lspconfig = pcall(require, 'lspconfig')
if not ok then
  vim.notify('lspconfig plugin not found', vim.log.levels.WARN)
  return
end

local servers = {
  'lua_ls',
  'pyright',
  'jsonls',
  'clangd',
  'bashls',
  'r_language_server',
  -- 'ccls',
}

local settings = {
  ui = {
    border = 'none',
    icons = {
      package_installed = '◍',
      package_pending = '◍',
      package_uninstalled = '◍',
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
}

mason.setup(settings)
mason_lspconfig.setup({
  ensure_installed = servers,
  automatic_installation = true,
})

local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = require('core.lsp.handlers').on_attach,
    capabilities = require('core.lsp.handlers').capabilities,
  }

  server = vim.split(server, '@')[1]

  local conf_exists, conf_opts = pcall(require, 'core.lsp.settings.' .. server)
  if conf_exists then
    opts = vim.tbl_deep_extend('force', conf_opts, opts)
  else
    vim.notify('Can\'t require: core.lsp.settings.' .. server, vim.log.levels.WARN)
  end

  -- print all entries of opts table
  -- print(server .. ' opts')
  -- print(vim.inspect(opts))

  lspconfig[server].setup(opts)
end


-- require 'mason' .setup()

--local DEFAULT_SETTINGS = {
--    -- The directory in which to install packages.
--    install_root_dir = path.concat { vim.fn.stdpath 'data', 'mason' },

--    -- Where Mason should put its bin location in your PATH. Can be one of:
--    -- - 'prepend' (default, Mason's bin location is put first in PATH)
--    -- - 'append' (Mason's bin location is put at the end of PATH)
--    -- - 'skip' (doesn't modify PATH)
--    ---@type ''prepend'' | ''append'' | ''skip''
--    PATH = 'prepend',

--    pip = {
--        -- Whether to upgrade pip to the latest version in the virtual environment before installing packages.
--        upgrade_pip = false,

--        -- These args will be added to `pip install` calls. Note that setting extra args might impact intended behavior
--        -- and is not recommended.
--        --
--        -- Example: { '--proxy', 'https://proxyserver' }
--        install_args = {},
--    },

--    -- Controls to which degree logs are written to the log file. It's useful to set this to vim.log.levels.DEBUG when
--    -- debugging issues with package installations.
--    log_level = vim.log.levels.INFO,

--    -- Limit for the maximum amount of packages to be installed at the same time. Once this limit is reached, any further
--    -- packages that are requested to be installed will be put in a queue.
--    max_concurrent_installers = 4,

--    github = {
--        -- The template URL to use when downloading assets from GitHub.
--        -- The placeholders are the following (in order):
--        -- 1. The repository (e.g. 'rust-lang/rust-analyzer')
--        -- 2. The release version (e.g. 'v0.3.0')
--        -- 3. The asset name (e.g. 'rust-analyzer-v0.3.0-x86_64-unknown-linux-gnu.tar.gz')
--        download_url_template = 'https://github.com/%s/releases/download/%s/%s',
--    },

--    -- The provider implementations to use for resolving package metadata (latest version, available versions, etc.).
--    -- Accepts multiple entries, where later entries will be used as fallback should prior providers fail.
--    -- Builtin providers are:
--    --   - mason.providers.registry-api (default) - uses the https://api.mason-registry.dev API
--    --   - mason.providers.client                 - uses only client-side tooling to resolve metadata
--    providers = {
--        'mason.providers.registry-api',
--    },

--    ui = {
--        -- Whether to automatically check for new versions when opening the :Mason window.
--        check_outdated_packages_on_open = true,

--        -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
--        border = 'none',

--        icons = {
--            -- The list icon to use for installed packages.
--            package_installed = '◍',
--            -- The list icon to use for packages that are installing, or queued for installation.
--            package_pending = '◍',
--            -- The list icon to use for packages that are not installed.
--            package_uninstalled = '◍',
--        },

--        keymaps = {
--            -- Keymap to expand a package
--            toggle_package_expand = '<CR>',
--            -- Keymap to install the package under the current cursor position
--            install_package = 'i',
--            -- Keymap to reinstall/update the package under the current cursor position
--            update_package = 'u',
--            -- Keymap to check for new version for the package under the current cursor position
--            check_package_version = 'c',
--            -- Keymap to update all installed packages
--            update_all_packages = 'U',
--            -- Keymap to check which installed packages are outdated
--            check_outdated_packages = 'C',
--            -- Keymap to uninstall a package
--            uninstall_package = 'X',
--            -- Keymap to cancel a package installation
--            cancel_installation = '<C-c>',
--            -- Keymap to apply language filter
--            apply_language_filter = '<C-f>',
--        },
--    },
--}
