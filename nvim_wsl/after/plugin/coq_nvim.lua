local ok1, coq = pcall(require, 'coq')
local ok2, coq_3p = pcall(require, 'coq_3p')

if not (ok1 and ok2) then
  vim.notify('Coq or coq_3p plugins not found', vim.log.levels.INFO)
  return
end

-- Coq third party config
coq_3p {
  -- { src = 'nvimlua', short_name = 'nLUA', conf_only = false  },
  -- { src = 'builtin/c'       },
  -- {
  --   src = 'repl',
  --   sh = 'bash',
  --   -- shell = { p = 'perl', n = 'node', ... },
  --   max_lines = 99,
  --   deadline = 500,
  --   unsafe = { 'rm', 'poweroff', 'mv' }
  -- },
  -- { src = 'bc', short_name = 'MATH', precision = 6 },
  -- { src = 'copilot', short_name = 'COP', accept_key = '<c-f>' },
 }

-- ' This must be set BEFORE require('coq')
-- let g:coq_settings = { 'display.pum.fast_close': v:false  }
vim.g.coq_settings = {
  -- auto_start = 'shut-up',
  auto_start = true,
  keymap = {
    recommended = true,
    -- pre_select = false,
    -- manual_complete = '<C-SPACE>',
    -- repeat = null,
    -- bigger_preview = '<c-k>',
    -- jump_to_mark = '<c-h>',
    -- manual_complete_insertion_only = false,
  },
  clients = {
    buffers = {
      always_on_top = false,
      enabled       = false,
      match_syms    = false,
      parent_scope  = '⇊',
      same_filetype = false,
      short_name    = 'BUF',
      weight_adjust = 0
    },
    lsp = {
      always_on_top   = { },
      enabled         = true,
      resolve_timeout = 1.06,
      short_name      = 'LSP',
      weight_adjust   = 0.5
    },
    paths = {
      always_on_top = false,
      enabled       = false,
      path_seps     = { },
      preview_lines = 6,
      resolution    = { 'cwd', 'file' },
      short_name    = 'PATH',
      weight_adjust = 0
    },
    snippets = {
      always_on_top = false,
      enabled       = false,
      short_name    = 'SNIP',
      user_path     = 'None',
      warn          = { 'missing', 'outdated' },
      weight_adjust = 0.1
    },
    tabnine = {
      always_on_top = false,
      enabled       = false,
      short_name    = 'T9',
      weight_adjust = -0.1
    },
    tags = {
      always_on_top = false,
      enabled       = false,
      parent_scope  = '⇊',
      path_sep      = '⇉' ,
      short_name    = 'TAG',
      weight_adjust = 0.1
    },
    third_party = {
      always_on_top = nil,
      enabled = false,
      short_name = '3P',
      weight_adjust = 0
    },
    tmux = {
      all_sessions = true,
      always_on_top = false,
      enabled = false,
      match_syms = false,
      parent_scope = '⇊',
      path_sep = '⇉',
      short_name = 'TMUX',
      weight_adjust = -0.1
    },
    tree_sitter = {
      always_on_top  = false,
      enabled        = false,
      path_sep       = '⇊',
      short_name     = 'TS',
      slow_threshold = 0.168,
      weight_adjust  = 0.1
    },
  },
}

-- keymap.recommended:
-- <esc> -> exit to normal
-- <bs> -> backspace always, even when completion menu is open
-- <c-w> -> delete word before the cursor, even when completion menu is open
-- <c-u> -> delete all entered characters before the cursor, even when completion menu is open
-- <cr> -> used to select completion if completion menu is open
-- <tab> -> if completion menu is open: select next item
-- <s-tab> -> if completion menu is open: select prev item

-- 🐓 Coq completion settings

-- -- Keybindings
-- ino <silent><expr> <Esc>   pumvisible() ? '\<C-e><Esc>' : '\<Esc>'
-- ino <silent><expr> <C-c>   pumvisible() ? '\<C-e><C-c>' : '\<C-c>'
-- ino <silent><expr> <BS>    pumvisible() ? '\<C-e><BS>'  : '\<BS>'
-- ino <silent><expr> <CR>    pumvisible() ? (complete_info().selected == -1 ? '\<C-e><CR>' : '\<C-y>') : '\<CR>'
-- ino <silent><expr> <Tab>   pumvisible() ? '\<C-n>' : '\<Tab>'
-- ino <silent><expr> <S-Tab> pumvisible() ? '\<C-p>' : '\<BS>'

