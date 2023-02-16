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
HISTSIZE=10000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

# The following block is surrounded by two delimiters.
# These delimiters must not be modified. Thanks.
# START KALI CONFIG VARIABLES
PROMPT_ALTERNATIVE=twoline
NEWLINE_BEFORE_PROMPT=yes
# STOP KALI CONFIG VARIABLES

if [ "$color_prompt" = yes ]; then
    # override default virtualenv indicator in prompt
    VIRTUAL_ENV_DISABLE_PROMPT=1

    prompt_color='\[\033[;32m\]'
    info_color='\[\033[1;34m\]'
    prompt_symbol=㉿
    if [ "$EUID" -eq 0 ]; then # Change prompt colors for root user
        prompt_color='\[\033[;94m\]'
        info_color='\[\033[1;31m\]'
        prompt_symbol=💀
    fi
    case "$PROMPT_ALTERNATIVE" in
        twoline)
            PS1=$prompt_color'┌──${debian_chroot:+($debian_chroot)──}${VIRTUAL_ENV:+(\[\033[0;1m\]$(basename $VIRTUAL_ENV)'$prompt_color')}('$info_color'\u${prompt_symbol}\h'$prompt_color')-[\[\033[0;1m\]\w'$prompt_color']:\[\033[0;51m\]\T'$prompt_color'\n'$prompt_color'└─'$info_color'\$ '$info_color"\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')"$info_color'\[\033[0m\] ';;
        oneline)
            PS1='${VIRTUAL_ENV:+($(basename $VIRTUAL_ENV)) }${debian_chroot:+($debian_chroot)}'$info_color'\u@\h\[\033[00m\]:'$prompt_color'\[\033[01m\]\w\[\033[00m\]\$ ';;
        backtrack)
            PS1='${VIRTUAL_ENV:+($(basename $VIRTUAL_ENV)) }${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ ';;
    esac
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# # If this is an xterm set the title to user@host:dir
# case "$TERM" in
# xterm*|rxvt*|Eterm|aterm|kterm|gnome*|alacritty)
#     PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#     ;;
# *)
#     ;;
# esac

[ "$NEWLINE_BEFORE_PROMPT" = yes ] && PROMPT_COMMAND="PROMPT_COMMAND=echo"

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
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

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
export VISUAL='nvim'
export WATCH_INTERVAL=1
export LESS='RFiJ --incsearch'
# export XDG_DATA_HOME="$HOME/.local/share"
# export XDG_CONFIG_HOME="$HOME/.config"
# export XDG_STATE_HOME="$HOME/.local/state"
# export XDG_CACHE_HOME="$HOME/.cache"
# export XDG_RUNTIME_DIR="/run/user/$UID"
# export XDG_RUNTIME_DIR="/tmp/$UID-runtime"

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
alias dot='cd ~/Desktop/myrepos/configs; gs'

# git
alias gs='git status'

# EMACS
alias emacs='emacsclient -c -a ""'
alias et='\emacs -nw'

alias vi='nvim -u NONE'

# sudo mkdir -p /run/user/$UID
# sudo chown gheiath /run/user/$UID
# sudo chmod 700 /run/user/$UID

## .dotfiles
alias cb='nvim ~/.bashrc'
alias cn='nvim ~/.config/nvim/init.lua'
# alias cq='nvim /mnt/c/Users/Ghieath/AppData/Roaming/qutebrowser/config/config.py'
alias ca='nvim /mnt/c/Users/Ghieath/scoop/persist/alacritty/alacritty.yml'
alias cm='nvim /mnt/c/Users/Ghieath/scoop/persist/mpv/portable_config'

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
