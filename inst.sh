#!/bin/bash

# PATHS
REPO=$HOME"/Desktop/myrepos/configs"
NVIM=$HOME"/.config/nvim/"
GIT=$HOME"/.config/git/"
BAT=$HOME"/.config/bat/"
scoop=$WINHOME"/scoop"
MPV=$scoop"/persist/mpv/portable_config/"
ALACRITTY=$scoop"/persist/alacritty/alacritty.yml"
WSLTTY=$scoop"/persist/wsltty/config/config"
WEZTERM=$scoop"/persist/wezterm/wezterm.lua"
BASH=$HOME"/"
## Avoid duplicate, TODO: improve
TMUX=$HOME"/Desktop/.."
LUNARVIM=$HOME"/.config/lvim/"
WSL=$WINHOME"/.wslconfig"

# Pack in one list, path & name
# can't use set, must be array!
declare -A configs
configs=(
  ["$NVIM"]="nvim_wsl"
  ["$GIT"]="git"
  ["$BAT"]="bat_wsl"
  # ["$MPV"]="mpv_win/"
  # ["$ALACRITTY"]="alacritty_win/alacritty.yml"
  # ["$WSLTTY"]="wsltty/config"
  # ["$WEZTERM"]="wezterm/wezterm.lua"
  ["$BASH"]="bash_wsl"
  ["$TMUX"]="tmux_wsl"
  ["$LUNARVIM"]="lvim_wsl"
  # ["$WSL"]="wsl_distros_global/.wslconfig"
)

for path in ${!configs[@]}; do
  name=${configs[$path]}
  echo stow --target=$path $name
  stow --target=$path $name
done
