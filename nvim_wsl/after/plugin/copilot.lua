require('copilot').setup {
  panel = {
    -- Disable to avoid conflict with nvim-cmp
    enabled = false,
    -- enabled = true,
    auto_refresh = false,
    keymap = {
      jump_prev = '[[',
      jump_next = ']]',
      accept = '<CR>',
      refresh = 'gr',
      open = '<M-CR>',
    },
  },
  suggestion = {
    enabled = true,
    -- Start suggesting as soon as you enter insert mode.
    auto_trigger = true,
    debounce = 75,
    keymap = {
      accept_word = false,
      accept_line = false,
      accept = '<M-CR>',
      prev = '<M-[>',
      next = '<M-]>',
      dismiss = '<M-BS>',
    },
  },
  filetypes = {
    yaml = false,
    markdown = false,
    help = false,
    gitcommit = false,
    gitrebase = false,
    hgcommit = false,
    svn = false,
    cvs = false,
    ['.'] = false,
  },
  copilot_node_command = 'node', -- Node.js version must be > 16.x
  server_opts_overrides = {
    -- trace = "verbose",
    -- settings = {
    --   advanced = {
    --     listCount = 5, -- #completions for panel
    --     inlineSuggestCount = 5, -- #completions for getCompletions
    --   }
    -- },
  },
}
