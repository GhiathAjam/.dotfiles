local wezterm = require 'wezterm'
local wsl_domains = wezterm.default_wsl_domains()

wezterm.on("gui-startup", function(cmd)
  local _, _, window = wezterm.mux.spawn_window(cmd or {})
  window:gui_window():toggle_fullscreen()
end)

for _, domain in ipairs(wsl_domains) do
  domain.default_cwd = "~"
end

return {
  -- font = wezterm.font('JetBrainsMono NFM', { weight = 'Regular', italic = false }),
  -- font = wezterm.font('CaskaydiaCove NFM', { weight = 'Regular', italic = false }),
  -- font = wezterm.font 'Consolas',
  -- default_prog = { '/usr/local/bin/fish', '-l' },
  default_prog = { 'pwsh.exe' },
  -- default_cwd = "/some/path",
  -- color_scheme = "GoogleDark (Gogh)",
  enable_scroll_bar = false,
  set_environment_variables = {
    -- This changes the default prompt for cmd.exe to report the
    -- current directory using OSC 7, show the current time and
    -- the current directory colored in the prompt.
    prompt = '$E]7;file://localhost/$P$E\\$E[32m$T$E[0m $E[35m$P$E[36m$_$G$E[0m ',
  },
  -- font_size = 11,
  enable_tab_bar = true,
  -- window_background_opacity = 0.9,
  window_background_opacity = 1,
  -- window_padding = {
  --   left = 0,
  --   right = 5,
  --   top = 0,
  --   bottom = 0,
  -- },

  adjust_window_size_when_changing_font_size = false,
  audible_bell = 'Disabled',
  colors = {
    scrollbar_thumb = '#F22222',
    foreground = '#C0C5CE',
    background = '#202020',

    ansi = {
      '#4C4C4C', -- black
      '#FF3C3C', -- red
      '#0DBC79', -- green
      '#E5E510', -- yellow
      '#3B8EEA', -- blue
      '#BC3FBC', -- magenta
      '#11A8CD', -- cyan
      '#E5E5E5', -- white
    },

    brights = {
      '#666666', -- black
      '#F14C4C', -- red
      '#23D18B', -- green
      '#F5F543', -- yellow
      '#3B8EEA', -- blue
      '#D670D6', -- magenta
      '#29B8DB', -- cyan
      '#E5E5E5', -- white
    }
  },
  -- background = {},
  color_scheme = 'SpaceGray',
  exit_behavior = 'Close',

  font = wezterm.font {
    family = 'CaskaydiaCove NFM',
    -- weight = 'Regular',
    stretch = 'Normal',
    style = 'Normal',
    -- harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
    -- harfbuzz_features = { 'cv29', 'cv30', 'ss01', 'ss03', 'ss06', 'ss07', 'ss09' },
  },
  font_size = 11,
  force_reverse_video_cursor = true,
  hide_tab_bar_if_only_one_tab = true,

  disable_default_key_bindings = true,
  keys = {
    { key = 'C',     mods = 'CTRL|SHIFT', action = wezterm.action.CopyTo 'Clipboard'    },
    { key = 'V',     mods = 'CTRL|SHIFT', action = wezterm.action.PasteFrom 'Clipboard' },
    -- { key = '-',     mods = 'CTRL',    action = wezterm.action.DecreaseFontSize      },
    -- { key = '=',     mods = 'CTRL',    action = wezterm.action.IncreaseFontSize      },
    -- { key = '0',     mods = 'CTRL',    action = wezterm.action.ResetFontSize         },
    { key = 'F11',                        action = wezterm.action.ToggleFullScreen      },
    { key = 'N',     mods = 'CTRL|SHIFT', action = wezterm.action.SpawnWindow           },
    -- { key = 'M',     mods = 'CTRL|SHIFT', action = wezterm.action.SpawnTab 'CurrentPaneDomain'   },
    -- Nightly Builds Only
    -- { key = 'P',     mods = 'CTRL|SHIFT', action = wezterm.action.ActivateCommandPalette           },
  },
  scrollback_lines = 10000,
  check_for_updates = false,
  show_update_window = false,
  use_dead_keys = false,
  unicode_version = 15,
  window_close_confirmation = 'NeverPrompt',
  window_padding = {
    left   = 0,
    right  = 0,
    -- top    = '0.2cell',
    top    = 0,
    bottom = 0,
  },
  wsl_domains = wsl_domains,

  -- Apply the bidi algorithm to lines at render time.
  -- Otherwise, wezterm will assume that the application(s)
  -- running in the terminal will output pre-bidi-shuffled output.

  -- "LeftToRight", "RightToLeft", "AutoLeftToRight", "AutoRightToLeft".
  -- Specifies the line direction. The Auto versions will attempt to
  -- auto-detect based on the first strong character in the line,
  -- but otherwise fall back to the direction specified.
  -- When the direction is RightToLeft or AutoRightToLeft,
  -- wezterm will try to show the text right justified.

  bidi_enabled = true,
  bidi_direction = "LeftToRight",
}
