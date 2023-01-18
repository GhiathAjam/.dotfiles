#!/bin/bash

# PATHS
REPO=$HOME"/Desktop/myrepos/configs"
NVIM=$HOME"/.config/nvim"
SCOOP="/mnt/c/Users/Ghieath/scoop"
MPV=$SCOOP"/persist/mpv/portable_config"
ALACRITTY=$SCOOP"/persist/alacritty/alacritty.yml"
BASH=$HOME"/.bashrc"
TMUX=$HOME"/.tmux.conf.local"
LUNARVIM=$HOME"/.config/lvim"
WSL="/mnt/c/Users/Ghieath/.wslconfig"


# Pack in one list, path & name
declare -A configs
configs=(
  ["$NVIM"]="nvim_wsl_kali"
  ["$MPV"]="mpv_win"
  ["$ALACRITTY"]="alacritty_win/alacritty.yml"
  ["$BASH"]="bash_wsl_kali/.bashrc"
  ["$TMUX"]="tmux_wsl_kali/.tmux.conf.local"
  ["$LUNARVIM"]="lvim_wsl_kali"
  ["$WSL"]="wsl_distros_global/.wslconfig"
)

for path in ${!configs[@]}; do
  name=$REPO/${configs[$path]}
  # remove old
  # printf "rm -rf $name \n"
  rm -rf $name
  # create parent but not LAST as it could be single file
  mkdir -p ${name%/*}
  # get new
  # printf "cp -r $path \t $name \n"
  cp -r $path $name
done
