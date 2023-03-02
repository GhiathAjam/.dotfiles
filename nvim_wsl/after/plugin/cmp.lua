local ok, cmp = pcall(require, 'cmp')
if not ok then
  vim.notify('cmp plugin not found', vim.log.levels.WARN)
  return
end

local ok, luasnip = pcall(require, 'luasnip')
if not ok then
  vim.notify('luasnip plugin not found', vim.log.levels.WARN)
  return
end

require('luasnip/loaders/from_vscode').lazy_load()

local check_backspace = function()
  local col = vim.fn.col '.' - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match '%s'
end

--   פּ ﯟ   some other good icons
local kind_icons = {
  Class = '',
  Color = '',
  Constant = '',
  Constructor = '',
  Copilot = '',
  Enum = '',
  EnumMember = '',
  Event = '',
  Field = '',
  File = '',
  Folder = '',
  Function = '',
  Interface = '',
  Keyword = '',
  Method = 'm',
  Module = '',
  Operator = '',
  Property = '',
  Reference = '',
  Snippet = '',
  Struct = '',
  Text = '',
  TypeParameter = '',
  Unit = '',
  Value = '',
  Variable = '',
}
-- find more here: https://www.nerdfonts.com/cheat-sheet

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-k>'] = cmp.mapping.select_prev_item({count=10}),
    ['<C-j>'] = cmp.mapping.select_next_item({count=10}),
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-1), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(1), { 'i', 'c' }),
    -- ['<c-x><c-n>'] = cmp.mapping(cmp.mapping.complete({config={sources={{name='digraphs'}}}}), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ['<CR>'] = cmp.mapping.confirm { select = false },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif check_backspace() then
        fallback()
      else
        fallback()
      end
    end, {
      'i',
      's',
    }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      'i',
      's',
    }),
  },
  formatting = {
    fields = { 'kind', 'abbr', 'menu' },
    format = function(entry, vim_item)
      local max_len = 40
      if string.len(vim_item.abbr) > max_len then
        vim_item.abbr = string.sub(vim_item.abbr, 1, max_len) .. '...'
      end
      -- pad smaller lengths
      -- if string.len(vim_item.abbr) < max_len then
      --   vim_item.abbr = vim_item.abbr .. string.rep(' ', max_len - string.len(vim_item.abbr))
      -- end
      -- Kind icons
      -- vim_item.kind = string.format('%s', kind_icons[vim_item.kind])
      -- This concatonates the icons with the name of the item kind
      vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
      vim_item.menu = ({
        nvim_lsp = '[LSP]',
        nvim_lua = '[NVIM_LUA]',
        luasnip  = '[Snippet]',
        buffer   = '[Buffer]',
        path     = '[Path]',
        copilot  = '[COPILOT]',
        digraphs = '[nvim_digraphs]',
      })[entry.source.name]
      return vim_item
    end,
  },
  sources = {
    { name = 'copilot',  group_index = 2 },
    { name = 'luasnip',  group_index = 2 },
    { name = 'nvim_lsp', group_index = 2 },
    { name = 'buffer',   group_index = 2 },
    { name = 'path',     group_index = 2 },
    { name = 'nvim_lua', group_index = 3 },
    { name = 'digraphs', group_index = 4 },
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = true,
  },
  window = {
    documentation = {
      border = 'rounded',
      -- max_width = 130,
      -- max_height = 30,
    },
    completion = {
      border = 'rounded',
    },
  },
  experimental = {
    ghost_text  = false,
    native_menu = false,
  },
}

-- -- Set up nvim-cmp.
-- local cmp = require'cmp'
--
-- cmp.setup({
--   snippet = {
--     -- REQUIRED - you must specify a snippet engine
--     expand = function(args)
--       vim.fn['vsnip#anonymous'](args.body) -- For `vsnip` users.
--       -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
--       -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
--       -- vim.fn['UltiSnips#Anon'](args.body) -- For `ultisnips` users.
--     end,
--   },
--   window = {
--     -- completion = cmp.config.window.bordered(),
--     -- documentation = cmp.config.window.bordered(),
--   },
--   mapping = cmp.mapping.preset.insert({
--     ['<C-b>'] = cmp.mapping.scroll_docs(-4),
--     ['<C-f>'] = cmp.mapping.scroll_docs(4),
--     ['<C-Space>'] = cmp.mapping.complete(),
--     ['<C-e>'] = cmp.mapping.abort(),
--     ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
--   }),
--   sources = cmp.config.sources({
--     -- { name = 'nvim_lua', group_index = 2 },
--     -- { name = 'nvim_lsp', group_index = 2 },
--     -- add copilot as source
--     { name = 'copilot', group_index = 2 },
--     -- { name = 'luasnip', group_index = 2 },
--     -- { name = 'buffer', group_index = 4 },
--   })
-- })
--
-- -- Set configuration for specific filetype.
-- cmp.setup.filetype('gitcommit', {
--   sources = cmp.config.sources({
--     { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
--   }, {
--     { name = 'buffer' },
--   })
-- })
--
-- -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline({ '/', '?' }, {
--   mapping = cmp.mapping.preset.cmdline(),
--   sources = {
--     { name = 'buffer' }
--   }
-- })
--
-- -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(':', {
--   mapping = cmp.mapping.preset.cmdline(),
--   sources = cmp.config.sources({
--     { name = 'path' }
--   }, {
--     { name = 'cmdline' }
--   })
-- })
--
-- -- Set up lspconfig.
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
--
-- require('lspconfig')['ccls'].setup {
--   capabilities = capabilities
-- }
--
-- require('lspconfig')['sumneko_lua'].setup {
--   capabilities = capabilities,
--   settings = {
--     Lua = {
--       -- runtime = {
--       --   -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--       --   version = 'LuaJIT',
--       --   -- Setup your lua path
--       --   path = runtime_path,
--       -- },
--       diagnostics = {
--         -- Get the language server to recognize the `vim` global
--         globals = { 'vim' },
--       },
--       workspace = {
--         -- Make the server aware of Neovim runtime files
--         library = vim.api.nvim_get_runtime_file('', true),
--         checkThirdParty = false, -- THIS IS THE IMPORTANT LINE TO ADD
--       },
--       -- Do not send telemetry data containing a randomized but unique identifier
--       telemetry = {
--         enable = false,
--       },
--     },
--   },
-- }
--
