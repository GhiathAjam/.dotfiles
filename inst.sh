#!/bin/bash

# PATHS
REPO=$HOME"/Desktop/myrepos/configs"
NVIM=$HOME"/.config/nvim/"
GIT=$HOME"/.config/git/"
scoop="/mnt/c/Users/Ghieath/scoop"
MPV=$scoop"/persist/mpv/portable_config/"
ALACRITTY=$scoop"/persist/alacritty/alacritty.yml"
BASH=$HOME"/"
## Avoid duplicate, TODO: improve
TMUX=$HOME"/Desktop/.."
LUNARVIM=$HOME"/.config/lvim/"
WSL="/mnt/c/Users/Ghieath/.wslconfig"

# Pack in one list, path & name
# can't use set, must be array!
declare -A configs
configs=(
  ["$NVIM"]="nvim_wsl"
  ["$GIT"]="git"
  # ["$MPV"]="mpv_win/"
  # ["$ALACRITTY"]="alacritty_win/alacritty.yml"
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
