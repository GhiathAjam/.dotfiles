#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
if [[ "${TRACE-0}" == "1" ]]; then
  set -o xtrace
fi

if [[ "${1-}" =~ ^-*h(elp)?$ ]]; then
  echo 'Usage: ./upd.sh

  this script rsyncs dotfiles from windows into dotfiles repo inside WSL
'
  exit
fi

cd "$(dirname "$0")"

main() {
  # PATHS
  # WSL:
  REPO=$HOME"/Desktop/myrepos/configs"
  BASH=$HOME"/.bashrc"
  TMUX=$HOME"/.tmux.conf.local"
  GIT=$HOME"/.config/git/"
  BAT=$HOME"/.config/bat/"
  NVIM=$HOME"/.config/nvim/"
  LUNARVIM=$HOME"/.config/lvim/"
  ZATHURA=$HOME"/.config/zathura/"
  CLANGD=$HOME"/.config/clangd/"
  CLANGFORMAT=$HOME"/"
  INCLUDE=$HOME"/.local/include/"
  CPPTEMPLATE=$HOME"/Desktop/"
  CPBOOSTER=$HOME"/.config/cpbooster/"
  GDU=$HOME"/.config/gdu/"

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
    # "$ZATHURA zathura_wsl/"
    # "$CLANGD clangd/"
    # "$CLANGFORMAT clang_format/"
    # "$INCLUDE include_wsl/"
    # "$CPPTEMPLATE cpp_template/"
    # "$CPBOOSTER cpbooster_wsl/"
    # "$GDU gdu_wsl/"

    # Windows
    "$WSL wsl_distros_global/.wslconfig NONE"
    "$MPV mpv_win/ watch_later"
    "$ALACRITTY alacritty_win/alacritty.yml NONE"
    "$WSLTTY wsltty/config NONE"
    "$WEZTERM wezterm/wezterm.lua NONE"
  )


  for pair in "${configs[@]}"; do
    ar=($pair)
    # remote
    path=${ar[0]}
    # local
    name=$REPO/${ar[1]}
    # exclusions
    exc=${ar[2]}
    printf "Copying $path To:\t $name \n"
    printf "Command: rsync -a $path $name --exclude $exc \n\n"
    # rsync -avh --progress $path $name --exclude $exc
    # printf "\n\n"
  done
}

main "$@"
