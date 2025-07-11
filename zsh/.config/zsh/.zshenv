
alias dcuf="docker compose up --build -d && docker compose logs -f "
alias dcbd="docker compose up --build -d"
alias dclf="docker compose logs -f "

export ZDOTDIR=$HOME/.config/zsh

if [ "$(uname)" = "Darwin" ]; then
	export PATH=/Users/ashleyx/.local/bin:$PATH
elif [ "$XDG_SESSION_TYPE" = "wayland" ];then
	export PATH=/home/ashleyx/.local/bin:$PATH
fi
# EXPORTS -----------------------------------------------------------

setopt globdots

export LC_ALL=en_IN.UTF-8
export LANG=en_IN.UTF-8

export VISUAL="nvim"
export EDITOR="$VISUAL"

export LOCAL="TRUE"
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
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
# python bullshit
export PYTHONDONTWRITEBYTECODE=1
export PYTHONSTARTUP="${XDG_CONFIG_HOME}"/python/pythonrc
export PYTHONUNBUFFERED=1
