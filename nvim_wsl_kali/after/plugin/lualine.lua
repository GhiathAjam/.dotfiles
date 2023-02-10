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

local _, lualine = pcall(require, 'lualine')
if not _ then return end

lualine.setup {  
  options = {
    icons_enabled = true,

    theme = 'onedarker',
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
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
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
    lualine_b = {'branch'},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {'tabs'}
  },
  winbar = {
    lualine_a = {'diagnostics'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {'diff'},
    lualine_y = {'filesize'},
    lualine_z = {'filetype'}
  },
  inactive_winbar = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  extensions = {}
}
