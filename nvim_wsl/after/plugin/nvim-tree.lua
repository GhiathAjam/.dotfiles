local ok, nvim_tree = pcall(require, 'nvim-tree')
if not ok then
  vim.notify('nvim-tree plugin not found', vim.log.levels.WARN)
  return
end

-- local config_status_ok, nvim_tree_config = pcall(require, 'nvim-tree.config')
-- if not config_status_ok then
--   return
-- end

-- local tree_cb = nvim_tree_config.nvim_tree_callback

-- nvim_tree.setup {
--   disable_netrw = true,
--   hijack_netrw = true,
--   open_on_setup = false,
--   ignore_ft_on_setup = {
--     'startify',
--     'dashboard',
--     'alpha',
--   },
--   auto_close = true,
--   open_on_tab = false,
--   hijack_cursor = false,
--   update_cwd = true,
--   update_to_buf_dir = {
--     enable = true,
--     auto_open = true,
--   },
--   diagnostics = {
--     enable = true,
--     icons = {
--       hint = '',
--       info = '',
--       warning = '',
--       error = '',
--     },
--   },
--   update_focused_file = {
--     enable = true,
--     update_cwd = true,
--     ignore_list = {},
--   },
--   system_open = {
--     cmd = nil,
--     args = {},
--   },
--   filters = {
--     dotfiles = false,
--     custom = {},
--   },
--   git = {
--     enable = true,
--     ignore = true,
--     timeout = 500,
--   },
--   view = {
--     width = 30,
--     height = 30,
--     hide_root_folder = false,
--     side = 'left',
--     auto_resize = true,
--     mappings = {
--       custom_only = false,
--       list = {
--         { key = { 'l', '<CR>', 'o' }, cb = tree_cb 'edit' },
--         { key = 'h', cb = tree_cb 'close_node' },
--         { key = 'v', cb = tree_cb 'vsplit' },
--       },
--     },
--     number = false,
--     relativenumber = false,
--   },
--   trash = {
--     cmd = 'trash',
--     require_confirm = true,
--   },
--   quit_on_open = 0,
--   git_hl = 1,
--   disable_window_picker = 0,
--   root_folder_modifier = ':t',
--   show_icons = {
--     git = 1,
--     folders = 1,
--     files = 1,
--     folder_arrows = 1,
--     tree_width = 30,
--   },
-- }

nvim_tree.setup({
  auto_reload_on_write = true,
  disable_netrw = false,
  hijack_cursor = false,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = false,
  ignore_buffer_on_setup = false,
  open_on_setup = false,
  open_on_setup_file = false,
  sort_by = 'name',
  root_dirs = {},
  prefer_startup_root = false,
  sync_root_with_cwd = false,
  reload_on_bufenter = false,
  respect_buf_cwd = false,
  on_attach = 'disable',
  -- remove all default keybindings
  remove_keymaps = true,
  select_prompts = false,
  view = {
    centralize_selection = false,
    cursorline = true,
    debounce_delay = 15,
    width = 40,
    hide_root_folder = false,
    side = 'right',
    preserve_window_proportions = false,
    number = false,
    relativenumber = false,
    signcolumn = 'yes',
    mappings = {
      list = {
        { key = '<C-e>',         action = 'edit_in_place' },
        { key = { '<CR>', 'l' }, action = 'edit' },
        -- { key = 'O',          action = 'edit_no_picker' },
        { key = 'c',             action = 'cd' },
        -- { key = '<C-v>',      action = 'vsplit' },
        -- { key = '<C-x>',      action = 'split' },
        -- { key = '<C-t>',      action = 'tabnew' },
        -- { key = '<',          action = 'prev_sibling' },
        -- { key = '>',          action = 'next_sibling' },
        { key = 'h',             action = 'parent_node' },
        -- { key = '<BS>',       action = 'close_node' },
        -- { key = '<Tab>',      action = 'preview' },
        -- { key = 'K',          action = 'first_sibling' },
        -- { key = 'J',          action = 'last_sibling' },
        -- { key = 'C',          action = 'toggle_git_clean' },
        -- { key = 'I',          action = 'toggle_git_ignored' },
        -- { key = 'H',          action = 'toggle_dotfiles' },
        -- { key = 'B',          action = 'toggle_no_buffer' },
        -- { key = 'U',          action = 'toggle_custom' },
        -- { key = 'R',          action = 'refresh' },
        { key = { '+', 'a' },    action = 'create' },
        { key = 'd',             action = 'remove' },
        -- { key = 'D',          action = 'trash' },
        { key = 'r',             action = 'rename' },
        -- { key = '<C-r>',      action = 'full_rename' },
        -- { key = 'e',          action = 'rename_basename' },
        -- { key = 'x',          action = 'cut' },
        -- { key = 'c',          action = 'copy' },
        -- { key = 'p',          action = 'paste' },
        -- { key = 'y',          action = 'copy_name' },
        -- { key = 'Y',          action = 'copy_path' },
        -- { key = 'gy',         action = 'copy_absolute_path' },
        -- { key = '[e',         action = 'prev_diag_item' },
        -- { key = '[c',         action = 'prev_git_item' },
        -- { key = ']e',         action = 'next_diag_item' },
        -- { key = ']c',         action = 'next_git_item' },
        { key = '-',             action = 'dir_up' },
        -- { key = 's',          action = 'system_open' },
        { key = 'f',             action = 'live_filter' },
        { key = 'F',             action = 'clear_live_filter' },
        -- { key = 'q',          action = 'close' },
        { key = 'H',             action = 'collapse_all' },
        { key = 'L',             action = 'expand_all' },
        -- { key = 'S',          action = 'search_node' },
        -- { key = '.',          action = 'run_file_command' },
        { key = '<C-k>',         action = 'toggle_file_info' },
        { key = 'g?',            action = 'toggle_help' },
        -- { key = 'm',          action = 'toggle_mark' },
        -- { key = 'bmv',        action = 'bulk_move' },
      },
    },
    float = {
      enable = false,
      quit_on_focus_loss = true,
      open_win_config = {
        relative = 'editor',
        border = 'rounded',
        width = 30,
        height = 30,
        row = 1,
        col = 1,
      },
    },
  },
  renderer = {
    add_trailing = false,
    group_empty = false,
    highlight_git = false,
    full_name = false,
    highlight_opened_files = 'none',
    highlight_modified = 'none',
    root_folder_label = ':~:s?$?/..?',
    indent_width = 2,
    indent_markers = {
      enable = true,
      inline_arrows = true,
      icons = {
        corner = '└',
        edge   = '│',
        item   = '│',
        bottom = '─',
        none   = ' ',
      },
    },
    icons = {
      webdev_colors = true,
      git_placement = 'before',
      modified_placement = 'after',
      padding = ' ',
      symlink_arrow = ' ➛ ',
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
        modified = true,
      },
      glyphs = {
        default  = '',
        symlink  = '',
        bookmark = '',
        modified = '●',
        folder = {
          arrow_closed = '',
          arrow_open   = '',
          default      = '',
          open         = '',
          empty        = '',
          empty_open   = '',
          symlink      = '',
          symlink_open = '',
        },
        git = {
          unstaged  = '✗',
          staged    = '✓',
          unmerged  = '',
          renamed   = '➜',
          untracked = '★',
          deleted   = '',
          ignored   = '◌',
        },
      },
    },
    special_files = { 'Cargo.toml', 'Makefile', 'README.md', 'readme.md' },
    symlink_destination = true,
  },
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  update_focused_file = {
    enable = false,
    update_root = false,
    ignore_list = {},
  },
  ignore_ft_on_setup = {},
  system_open = {
    cmd = '',
    args = {},
  },
  diagnostics = {
    enable = true,
    show_on_dirs = false,
    show_on_open_dirs = true,
    debounce_delay = 50,
    severity = {
      min = vim.diagnostic.severity.HINT,
      max = vim.diagnostic.severity.ERROR,
    },
    icons = {
      -- use icons from global lsp_signs
      hint    = vim.g.lsp_signs.Hint,
      info    = vim.g.lsp_signs.Information,
      warning = vim.g.lsp_signs.Warning,
      error   = vim.g.lsp_signs.Error,
    },
  },
  filters = {
    dotfiles = false,
    git_clean = false,
    no_buffer = false,
    custom = {},
    exclude = {},
  },
  filesystem_watchers = {
    enable = true,
    debounce_delay = 50,
    ignore_dirs = {},
  },
  git = {
    enable = true,
    ignore = true,
    show_on_dirs = true,
    show_on_open_dirs = true,
    timeout = 400,
  },
  modified = {
    enable = false,
    show_on_dirs = true,
    show_on_open_dirs = true,
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
    },
    expand_all = {
      max_folder_discovery = 300,
      exclude = {},
    },
    file_popup = {
      open_win_config = {
        col = 1,
        row = 1,
        relative = 'cursor',
        border = 'shadow',
        style = 'minimal',
      },
    },
    open_file = {
      quit_on_open = false,
      resize_window = true,
      window_picker = {
        enable = true,
        picker = 'default',
        chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890',
        exclude = {
          filetype = { 'notify', 'packer', 'qf', 'diff', 'fugitive', 'fugitiveblame' },
          buftype = { 'nofile', 'terminal', 'help' },
        },
      },
    },
    remove_file = {
      close_window = true,
    },
  },
  trash = {
    cmd = 'gio trash',
  },
  live_filter = {
    prefix = '[FILTER]: ',
    always_show_folders = true,
  },
  tab = {
    sync = {
      open = false,
      close = false,
      ignore = {},
    },
  },
  notify = {
    threshold = vim.log.levels.INFO,
  },
  ui = {
    confirm = {
      remove = true,
      trash = true,
    },
  },
  log = {
    enable = false,
    truncate = false,
    types = {
      all = false,
      config = false,
      copy_paste = false,
      dev = false,
      diagnostics = false,
      git = false,
      profile = false,
      watcher = false,
    },
  },
})
