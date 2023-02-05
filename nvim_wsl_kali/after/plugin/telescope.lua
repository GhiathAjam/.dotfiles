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
      '--smart-case'
    },
  },
  pickers = {
    colorscheme = {
      enable_preview = true
    }
  }
}

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
