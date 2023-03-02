#!/bin/bash

# PATHS
# WSL:
REPO=$HOME"/Desktop/myrepos/configs"
BASH=$HOME"/.bashrc"
TMUX=$HOME"/.tmux.conf.local"
GIT=$HOME"/.config/git/"
BAT=$HOME"/.config/bat/"
NVIM=$HOME"/.config/nvim/"
LUNARVIM=$HOME"/.config/lvim/"
# Windows:
WSL=$WINHOME"/.wslconfig"
scoop=$WINHOME"/scoop"
MPV=$scoop"/persist/mpv/portable_config/"
ALACRITTY=$scoop"/persist/alacritty/alacritty.yml"
WSLTTY=$scoop"/persist/wsltty/config/config"
WEZTERM=$scoop"/persist/wezterm/wezterm.lua"

# 1D array, use spaces for split
declare -a configs
configs=(
  # "$BASH bash_wsl/.bashrc"
  # "$TMUX tmux_wsl/.tmux.conf.local"
  # "$GIT git/"
  # "$BAT bat_wsl"
  # "$NVIM nvim_wsl/"
  # "$LUNARVIM lvim_wsl/"
  "$WSL wsl_distros_global/.wslconfig"
  "$MPV mpv_win/"
  "$ALACRITTY alacritty_win/alacritty.yml"
  "$WSLTTY wsltty/config"
  "$WEZTERM wezterm/wezterm.lua"
)

for pair in "${configs[@]}"; do
  ar=($pair)
  path=${ar[0]}
  name=$REPO/${ar[1]}
  printf "Copying $path To:\t $name \n"
  # printf "Command: rsync -a $path $name \n\n"
  # rsync -avh --progress $path $name
  # printf "\n\n"
done
