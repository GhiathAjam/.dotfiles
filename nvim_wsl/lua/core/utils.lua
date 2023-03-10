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

local map_opt = { noremap = true, silent = true }
local map_buffer_opt = { noremap = true, silent = true, buffer = 0 }

vim.g.lsp_signs = lsp_signs
vim.g.diff_signs = diff_signs
vim.g.map_opt = map_opt
vim.g.map_buffer_opt = map_buffer_opt
