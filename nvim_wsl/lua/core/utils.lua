-- lsp signs
local lsp_signs = {
  Error = '',
  Warning = '',
  Hint = '',
  Information = '',
}

-- diff signs
local diff_signs = {
  Add = '',
  Change = '',
  Delete = '',
  TopDelete = '',
  ChangeDelete = '',
  Untracked = '┆',
}
    -- add = { text = '+' },
    -- change = { text = '~' },
    -- delete = { text = '_' },
    -- topdelete = { text = '‾' },
    -- changedelete = { text = '~' },
    -- add          = { text = '│' },
    -- change       = { text = '│' },
    -- delete       = { text = '_' },
    -- topdelete    = { text = '‾' },
    -- changedelete = { text = '~' },
    -- untracked    = { text = '┆' },

vim.g.lsp_signs = lsp_signs
vim.g.diff_signs = diff_signs
