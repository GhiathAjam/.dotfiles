return

-- Coq third party config
require 'coq_3p' {
  { src = "nvimlua", short_name = "nLUA", conf_only = false  },
  { src = "builtin/c"       },
  {
    src = "repl",
    sh = "bash",
    -- shell = { p = "perl", n = "node", ... },
    max_lines = 99,
    deadline = 500,
    unsafe = { "rm", "poweroff", "mv" }
  },
  { src = "bc", short_name = "MATH", precision = 6 },
  -- { src = "copilot", short_name = "COP", accept_key = "<c-f>" },
 }

-- " This must be set BEFORE require("coq")
-- let g:coq_settings = { 'display.pum.fast_close': v:false  }
vim.g.coq_settings = {
  -- auto_start = 'shut-up',
  auto_start = true,
  keymap = {
    recommended = true,
    -- pre_select = false,
    -- manual_complete = '<C-SPACE>',
    -- repeat = null,
    -- bigger_preview = "<c-k>",
    -- jump_to_mark = '<c-h>',
    -- manual_complete_insertion_only = false,
  }
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
-- ino <silent><expr> <Esc>   pumvisible() ? "\<C-e><Esc>" : "\<Esc>"
-- ino <silent><expr> <C-c>   pumvisible() ? "\<C-e><C-c>" : "\<C-c>"
-- ino <silent><expr> <BS>    pumvisible() ? "\<C-e><BS>"  : "\<BS>"
-- ino <silent><expr> <CR>    pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"
-- ino <silent><expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
-- ino <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<BS>"

