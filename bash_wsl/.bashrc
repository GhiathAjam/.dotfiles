# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
# HISTCONTROL=ignoreboth
HISTCONTROL=ignoredups

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=30000
HISTFILESIZE=60000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

bold='\[\e[1m\]'
italic='\[\e[3m\]'
blackbg='\[\e[48;2;0;0;0m\]'
yellow='\[\e[38;2;210;200;14m\]'
green='\[\e[38;2;0;200;0m\]'
blue='\[\e[38;2;0;200;220m\]'
reset='\[\e[0m\]'
# component_separators = { left = '', right = ''},
# section_separators = { left = '', right = ''},
PS1=$bold$italic$blackbg\
$yellow'󰀄 \u@\H '\
$blue'  \w  '\
$green\
"\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1 /')"\
$reset' '

# newline between command and output
PS0='\n'

# newline before prompt
PROMPT_COMMAND="echo"

unset bold italic blackbg yellow green blue reset

# enable color support of ls, less and man, and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  # alias ls='ls --color=auto'
  # alias dir='dir --color=auto'
  # alias vdir='vdir --color=auto'

  # alias grep='grep --color=auto'
  # alias fgrep='fgrep --color=auto'
  # alias egrep='egrep --color=auto'
  # alias diff='diff --color=auto'
  alias ip='ip --color=auto'

  export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
  export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
  export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
  export LESS_TERMCAP_so=$'\E[01;33m'    # begin reverse video
  export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
  export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
  export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
fi

# colored GCC warnings and errors
# export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


[ -f ~/.fzf.bash ] && source ~/.fzf.bash

## MEEEEE
# Exports
export EDITOR='nvim'
export SUDO_EDITOR='nvim'
export VISUAL='nvim'
export WATCH_INTERVAL=1
export LESS='RFi --incsearch'
# export XDG_DATA_HOME="$HOME/.local/share"
# export XDG_CONFIG_HOME="$HOME/.config"
# export XDG_STATE_HOME="$HOME/.local/state"
# export XDG_CACHE_HOME="$HOME/.cache"
# export XDG_RUNTIME_DIR="/run/user/$UID"
# export XDG_RUNTIME_DIR="/tmp/$UID-runtime"

export WINHOME=$(wslpath $WSLENV)

# more PATH
export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH="$HOME/Desktop/scripts:$PATH"
export PATH="$HOME/.local/bin:$PATH"
# export CPLUS_INCLUDE_PATH="/usr/include/x86_64-linux-gnu/c++/11:.:/usr/include/c++/11:/usr/include/c++/11/backward:/usr/lib/gcc/x86_64-linux-gnu/11/include:/usr/local/include:/usr/include/x86_64-linux-gnu:/usr/include:$CPLUS_INCLUDE_PATH"

# Sources
# better colors
source ~/Desktop/repos/LS_COLORS/lscolors.sh

# better auto complete
bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous off"
bind "set completion-prefix-display-length 2"
bind "set show-all-if-unmodified on"
bind "set completion-map-case on"
bind "TAB:menu-complete"

alias wincp='win32yank.exe -i --crlf'
alias winpe='win32yank.exe -o --lf'
# alias cmakewin='/mnt/c/Program\ Files/JetBrains/Clion\ 2021.2/bin/cmake/win/bin/cmake.exe'
# alias bldgr='cmakewin --build cmake-build-debug --target GAME_APPLICATION'
alias clip='Clip.exe'
alias explorer='explorer.exe'
alias nv='neovide.exe --wsl'
alias brave='/mnt/c/Program\ Files\ \(x86\)/BraveSoftware/Brave-Browser/Application/brave.exe'
alias colortest='colortest-16'
# replace cat, ls, grep, diff, find
alias ls='exa --icons --group-directories-first -l'
alias la='ls -a'
alias lt='ls -TL'
alias lh='ls -aTL'
alias l='ls -aFl'
alias grep='\rg'
alias rg='batgrep -i'
# alias diff='delta'
alias man='batman'
alias tldr='tldr -t ocean'
# problem with non files
# alias fzf="fzf --preview 'batcat --color=always --style=numbers --line-range=:500 {}'"

# Problem solving go
alias go='cd ~/Desktop/main; nvim -S Session.vim'
# configure nvim
alias goc='cd ~/.config/nvim; nvim init.lua'
# dotfiles
alias dot='cd ~/Desktop/myrepos/configs && git s'

# EMACS
alias emacs='emacsclient -c -a ""'
alias et='\emacs -nw'

alias vi='nvim -u NONE'

# sudo mkdir -p /run/user/$UID
# sudo chown gheiath /run/user/$UID
# sudo chmod 700 /run/user/$UID

## .dotfiles
alias cgg='nvim $(echo "
  qutebrowser: /mnt/c/Users/Ghieath/AppData/Roaming/qutebrowser/config/config.py
  mpv:         /mnt/c/Users/Ghieath/scoop/persist/mpv/portable_config
  alacritty:   /mnt/c/Users/Ghieath/scoop/persist/alacritty/alacritty.yml
  wezterm:     /mnt/c/Users/Ghieath/scoop/persist/wezterm/wezterm.lua
  wsltty:      /mnt/c/Users/Ghieath/scoop/persist/wsltty/config/config
  wsl:         /mnt/c/Users/Ghieath/.wslconfig
  bash:        $HOME/.bashrc
  neovim:      $HOME/.config/nvim/init.lua
  git:         $HOME/.config/git/config
  bat:         $HOME/.config/bat/config" |\
   fzf --preview="bat --line-range=:500 {-1}" |\
   cut -d: -f2 )'

# powerline
# powerline-daemon -q
# POWERLINE_BASH_CONTINUATION=1
# POWERLINE_BASH_SELECT=1
# . /home/gheiath/.local/lib/python3.10/site-packages/powerline/bindings/bash/powerline.sh

function compile() {
  g++ -g -Wunused-macros -Wstack-usage=12345678 -Wuninitialized -fmax-errors=1 -fsanitize=pointer-subtract -fsanitize=pointer-compare -fno-sanitize-recover -fsanitize=address -fsanitize=undefined -Wno-variadic-macros -Wall -Wextra -pedantic -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wlogical-op -Wshift-overflow=2 -Wduplicated-branches -Wduplicated-cond -Wcast-qual -Wcast-align -D_GLIBCXX_DEBUG -D_GLIBCXX_ASSERTIONS -D_GLIBCXX_DEBUG_PEDANTIC -D_FORTIFY_SOURCE=2 -fstack-protector -D LLOC -std=c++20 $1 -o c && ./c
}

# default start dir
# cd ~/Desktop

wsl.exe -d wsl-vpnkit --cd /app service wsl-vpnkit status >/dev/null || \
  wsl.exe -d wsl-vpnkit --cd /app service wsl-vpnkit start

# export LIBGL_ALWAYS_INDIRECT=1
export DISPLAY=:0

## TODO:
# extend PRUNEDEPTH to include more dirs (/mnt in WSL)
