
# Add exports to /etc/bash.bashrc is using bash as default shell(recommended) to ensure its used for non interactive shells 

ZDOTDIR=$HOME/.config/zsh

# EXPORTS -----------------------------------------------------------

setopt globdots

export LC_ALL=en_IN.UTF-8
export LANG=en_IN.UTF-8

export VISUAL="nvim"
export EDITOR="$VISUAL"

export LESSHISTFILE=-

#WAYLAND 
export MOZ_ENABLE_WAYLAND=1

# Kitty terminal  ---------------------------------------
# kitty being weird with ssh the first time. who names terminal kitty ew
alias s="kitty +kitten ssh"
# Cleaner home dir ---------------------------------------
#XDG Specification
export XDG_DATA_HOME="$HOME"/.local/share
export XDG_STATE_HOME="$HOME"/.local/state
export XDG_CACHE_HOME="$HOME"/.cache
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_SCREENSHOTS_DIR="$HOME"/Pictures/Screenshots
# bad dev hall of shame
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export PYTHONSTARTUP="${XDG_CONFIG_HOME}"/python/pythonrc
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker


export TASKRC="$XDG_CONFIG_HOME"/.taskrc 
export TASKDATA="$XDG_DATA_HOME"/.task
