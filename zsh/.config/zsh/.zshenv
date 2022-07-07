ZDOTDIR=$HOME/.config/zsh

# EXPORTS -----------------------------------------------------------

setopt globdots

export LC_ALL=en_IN.UTF-8
export LANG=en_IN.UTF-8

export VISUAL="nvim"
export EDITOR="$VISUAL"

export LESSHISTFILE=-

if [ "$XDG_SESSION_TYPE" = "wayland" ]
then
    export MOZ_ENABLE_WAYLAND=1
fi


# Kitty terminal  ---------------------------------------
alias s="kitty +kitten ssh"

# Cleaner home dir ---------------------------------------
#XDG Specification
export XDG_DATA_HOME="$HOME"/.local/share
export XDG_STATE_HOME="$HOME"/.local/state
export XDG_CACHE_HOME="$HOME"/.cache
export XDG_CONFIG_HOME="$HOME"/.config
# bad dev hall of shame
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export PYTHONSTARTUP="${XDG_CONFIG_HOME}/python/pythonrc"
