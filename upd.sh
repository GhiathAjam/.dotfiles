#!/bin/bash

# PATHS
REPO=$HOME"/Desktop/myrepos/configs"
NVIM=$HOME"/.config/nvim/"
GIT=$HOME"/.config/git/"
scoop="/mnt/c/Users/Ghieath/scoop"
MPV=$scoop"/persist/mpv/portable_config/"
ALACRITTY=$scoop"/persist/alacritty/alacritty.yml"
BASH=$HOME"/.bashrc"
TMUX=$HOME"/.tmux.conf.local"
LUNARVIM=$HOME"/.config/lvim/"
WSL="/mnt/c/Users/Ghieath/.wslconfig"


# Pack in one list, path & name
declare -A configs
configs=(
  # ["$NVIM"]="nvim_wsl/"
  # ["$GIT"]="git/"
  ["$MPV"]="mpv_win/"
  ["$ALACRITTY"]="alacritty_win/alacritty.yml"
  # ["$BASH"]="bash_wsl/.bashrc"
  # ["$TMUX"]="tmux_wsl/.tmux.conf.local"
  # ["$LUNARVIM"]="lvim_wsl/"
  ["$WSL"]="wsl_distros_global/.wslconfig"
)

for path in ${!configs[@]}; do
  name=$REPO/${configs[$path]}
  printf "Copying $path To:\t $name \n"
  printf "Command: rsync -a $path $name \n\n"
  rsync -avh --progress $path $name
  printf "\n\n"

  # remove old
  # printf "rm -rf $name \n"
  # rm -rf $name
  # create parent but not LAST as it could be single file
  # mkdir -p ${name%/*}
  # get new
  # printf "cp -r $path \t $name \n"
  # cp -r $path $name
done
