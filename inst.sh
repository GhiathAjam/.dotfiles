#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
if [[ "${TRACE-0}" == "1" ]]; then
  set -o xtrace
fi

if [[ "${1-}" =~ ^-*h(elp)?$ ]]; then
  echo 'Usage: ./inst.sh

  this script installs dotfiles
'
  exit
fi

cd "$(dirname "$0")"

main() {
  # PATHS
  # WSL:
  REPO=$HOME"/Desktop/myrepos/configs"
  BASH=$HOME"/"
  TMUX=$HOME"/"
  GIT=$HOME"/.config/git/"
  BAT=$HOME"/.config/bat/"
  NVIM=$HOME"/.config/nvim/"
  LUNARVIM=$HOME"/.config/lvim/"
  ZATHURA=$HOME"/.config/zathura/"
  CLANGD=$HOME"/.config/clangd/"
  CLANGFORMAT=$HOME"/"
  INCLUDE=$HOME"/.local/include/"
  CPPTEMPLATE=$HOME"/Desktop/"
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
    # "$BASH bash_wsl"
    # "$TMUX tmux_wsl"
    # "$GIT git"
    # "$BAT bat_wsl"
    # "$NVIM nvim_wsl"
    # "$LUNARVIM lvim_wsl"
    # "$ZATHURA zathura_wsl"
    # "$CLANGD clangd"
    # "$CLANGFORMAT clang_format"
    # "$INCLUDE include_wsl"
    # "$CPPTEMPLATE cpp_template"
    # "$WSL wsl_distros_global/.wslconfig"
    # "$MPV mpv_win/"
    # "$ALACRITTY alacritty_win/alacritty.yml"
    # "$WSLTTY wsltty/config"
    # "$WEZTERM wezterm/wezterm.lua"
  )

  for pair in "${configs[@]}"; do
    ar=($pair)
    path=${ar[0]}
    name=${ar[1]}
    echo mkdir -p $path
    # mkdir -p $path
    echo stow --target=$path $name
    # stow --target=$path $name
  done
}

main "$@"
