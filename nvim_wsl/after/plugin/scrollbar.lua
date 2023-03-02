local ok, scrollbar = pcall(require, 'scrollbar')
if not ok then
  vim.notify('scrollbar plugin not found', vim.log.levels.WARN)
  return
end

scrollbar.setup {
  throttle_ms = 100,
  show = true,
  show_in_active_only = false,
  -- handle folds, set to number to disable folds if no. of lines in buffer exceeds this
  folds = 1000,
  -- disables if no. of lines in buffer exceeds this
  max_lines = 1000,
  -- Hides everything if all lines are visible
  hide_if_all_visible = true,
  handle = {
    text                = " ",
    color               = '#505000',
    -- highlight           = "CursorColumn",
    -- -- Hides handle if all lines are visible
    -- hide_if_all_visible = true,
  },
  marks = {
    Cursor = {
      text      = "◆",
      priority  = 0,
      gui       = 'reverse',
      highlight = "Normal",
    },
    Search = {
      text      = { "▐", "▐" },
      priority  = 1,
      gui       = nil,
      highlight = "Search",
    },
    Error = {
      text      = { "▐", "▐" },
      priority  = 2,
      gui       = nil,
      highlight = "DiagnosticError",
    },
    Warn = {
      text      = { "▐", "▐" },
      priority  = 3,
      gui       = nil,
      highlight = "DiagnosticWarn",
    },
    Info = {
      text      = { "▐", "▐" },
      priority  = 4,
      gui       = nil,
      highlight = "DiagnosticVirtualTextInfo",
    },
    Hint = {
      text      = { "▐", "▐" },
      priority  = 5,
      gui       = nil,
      highlight = "DiagnosticVirtualTextHint",
    },
    Misc = {
      text      = { "▐", "▐" },
      priority  = 6,
      gui       = nil,
      highlight = "Normal",
    },
    GitAdd = {
      text      = "▐",
      priority  = 7,
      gui       = nil,
      highlight = "GitSignsAdd",
    },
    GitChange = {
      text      = "▐",
      priority  = 7,
      gui       = nil,
      highlight = "GitSignsChange",
    },
    GitDelete = {
      text      = "▐",
      priority  = 7,
      gui       = nil,
      highlight = "GitSignsDelete",
    },
  },
  excluded_buftypes = {
    "terminal",
  },
  excluded_filetypes = {
    "prompt",
    "TelescopePrompt",
    "noice",
  },
  autocmd = {
    render = {
      "BufWinEnter",
      "TabEnter",
      "TermEnter",
      "WinEnter",
      "CmdwinLeave",
      "TextChanged",
      "VimResized",
      "WinScrolled",
    },
    clear = {
      "BufWinLeave",
      "TabLeave",
      "TermLeave",
      "WinLeave",
    },
  },
  handlers = {
    cursor     = true,
    diagnostic = true,
    gitsigns   = false, -- Requires gitsigns
    handle     = true,
    search     = false, -- Requires hlslens
    ale        = false, -- Requires ALE
  },
}
