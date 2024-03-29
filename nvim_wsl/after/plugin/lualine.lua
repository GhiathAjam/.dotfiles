vim.opt.showmode = false
-- apt install powerline-font
-- powerline symbols
-- let g:airline_symbols.branch = ''
-- let g:airline_symbols.readonly = ''
-- let g:airline_symbols.linenr = '☰ '
-- let g:airline_symbols.maxlinenr = ''
-- let g:airline_symbols.dirty='⚡'
-- let g:airline_symbols.colnr = ':'
-- let g:airline_symbols.

local ok, lualine = pcall(require, 'lualine')
if not ok then
  vim.notify('lualine plugin not found', vim.log.levels.WARN)
  return
end

lualine.setup {
  options = {
    icons_enabled = true,

    -- theme = 'onedarker',
    -- theme = 'horizon',
    -- theme = 'tokyonight',
    -- theme = 'gruvbox',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {
      'branch',
      {
        'diff',
         colored = true,
         -- diff_color = { added = 'GitSignsAdd', modified = 'GitSignsChange', removed = 'GitSignsDelete', },
         symbols = {
          added = vim.g.diff_signs.Add .. ' ',
          modified = vim.g.diff_signs.Change .. ' ',
          removed = vim.g.diff_signs.Delete .. ' ' ,
        },
      },
      {
        'diagnostics',
        -- diagnostics_color = {
        --   error = 'DiagnosticError',
        --   warn  = 'DiagnosticSignWarn',
        --   info  = 'DiagnosticSignInfo',
        --   hint  = 'DiagnosticHint',
        -- },
        symbols = {
          error = vim.g.lsp_signs.Error .. ' ',
          warn  = vim.g.lsp_signs.Warning .. ' ',
          info  = vim.g.lsp_signs.Information .. ' ',
          hint  = vim.g.lsp_signs.Hint .. ' ',
        },
      },
    },
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress', 'filesize'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
    lualine_a = {'buffers'},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {'tabs'}
  },
  winbar = {
    -- lualine_a = {
    --   {
    --     'diagnostics',
    --      colored = false,
    --       -- diagnostics_color = {
    --       --   error = 'DiagnosticError', -- Changes diagnostics' error color.
    --       --   warn  = 'DiagnosticWarn',  -- Changes diagnostics' warn color.
    --       --   info  = 'DiagnosticInfo',  -- Changes diagnostics' info color.
    --       --   hint  = 'DiagnosticHint',  -- Changes diagnostics' hint color.
    --       -- },
    --      -- symbols = {error = 'E', warn = 'W', info = 'I', hint = 'H'},
    --   },
    -- },
    -- lualine_b = {'branch'},
    -- lualine_c = {'filename'},
    -- lualine_x = {'diff'},
    -- lualine_y = {'filesize'},
    -- lualine_z = {'filetype'}
  },
  inactive_winbar = {
    -- lualine_a = {},
    -- lualine_b = {},
    -- lualine_c = {'filename'},
    -- lualine_x = {},
    -- lualine_y = {},
    -- lualine_z = {}
  },
  extensions = {
    'fugitive',
    'nvim-tree',
    'nvim-dap-ui',
    'quickfix',
    'toggleterm',

    -- outline of code
    -- 'aerial',
    -- 'symbols-outline',

    -- 'fzf',
    -- 'man',

    -- like undo tree
    -- 'mundo',

    -- tree explorers
    -- 'fern',
    -- 'chadtree',
    -- 'neo-tree',
    -- 'nerdtree',
  },
}
