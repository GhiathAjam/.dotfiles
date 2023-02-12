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
      open = '<M-CR>'
    },
  },
  suggestion = {
    -- avoid conflict with nvim-cmp
    enabled = false,
    -- enabled = true,
    auto_trigger = false,
    debounce = 75,
    keymap = {
      accept = '<M-l>',
      accept_word = false,
      accept_line = false,
      -- next = '<M-]>',
      next = '<C-;>',
      prev = '<M-[>',
      dismiss = '<C-]>',
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
  server_opts_overrides = {},
}
