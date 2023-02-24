local telescope = require 'telescope'

telescope.setup {
  defaults = {
    dynamic_preview_title = true,
    results_title = false,
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '-L',
    },
    --     Currently mappings still need to be added, Example:
    mappings = {
      i = {
        ['<C-j>'] = require('telescope.actions').cycle_history_next,
        ['<C-k>'] = require('telescope.actions').cycle_history_prev,
        ['<C-Down>'] = require('telescope.actions').preview_scrolling_down,
        ['<C-Up>'] = require('telescope.actions').preview_scrolling_up,
      },
    },
    layout_strategy = 'horizontal',
    layout_config = {
      horizontal = {
        height = 0.7,
        width = 0.9,
        -- what is this?
        -- preview_cutoff = 120,
        prompt_position = "bottom",
        preview_width = 0.5,
      }
    },
    border = true,
    borderchars = {
      prompt  = { "─", "│", "─", "│", "┌", '┐', '┘', '└' },
      results = { "─", "│", "─", "│", "┌", '┐', '┘', '└' },
      preview = { "─", "│", "─", "│", "┌", '┐', '┘', '└' },
    },
  },
  pickers = {
    colorscheme = {
      enable_preview = true,
    },
    find_files = {
      follow = true,
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"    
    },
  },
}

require('telescope').load_extension('fzf')
require"telescope".load_extension("frecency")

-- See:  
  -- |telescope.mappings|
  -- *telescope.defaults.file_ignore_patterns*

    -- history:  
    --     This field handles the configuration for prompt history.
    --     By default it is a table, with default values (more below).
    --     To disable history, set it to false.

    --     Currently mappings still need to be added, Example:
    --       mappings = {
    --         i = {
    --           ['<C-Down>'] = require('telescope.actions').cycle_history_next,
    --           ['<C-Up>'] = require('telescope.actions').cycle_history_prev,
    --         },
    --       },

    --     Fields:
    --       - path:    The path to the telescope history as string.
    --                  default: stdpath('data')/telescope_history
    --       - limit:   The amount of entries that will be written in the
    --                  history.
    --                  Warning: If limit is set to nil it will grow unbound.
    --                  default: 100
    --       - handler: A lua function that implements the history.
    --                  This is meant as a developer setting for extensions to
    --                  override the history handling, e.g.,
    --                  https://github.com/nvim-telescope/telescope-smart-history.nvim,
    --                  which allows context sensitive (cwd + picker) history.

    --                  Default:
    --                  require('telescope.actions.history').get_simple_history
