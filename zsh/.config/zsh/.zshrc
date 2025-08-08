autoload -Uz compinit
compinit -D

if [[ -f "/opt/homebrew/bin/brew" ]] then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in Powerlevel10k

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# Add in snippets
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::git-auto-fetch


# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# TMUX -----------------------------------------------------------

source $ZDOTDIR/.tmux-setup.sh
if [ "$(uname)" = "Darwin" ]; then
	aerospace_id=$(aerospace list-workspaces --focused)
	local_attached=$(tmux ls -F '#{session_name} #{session_attached}' | grep Local | awk '{print $2}')
	monitor_attached=$(tmux ls -F '#{session_name} #{session_attached}' | grep Performance | awk '{print $2}')
	server_attached=$(tmux ls -F '#{session_name} #{session_attached}' | grep Server | awk '{print $2}')
	if [ $aerospace_id = "2" ] && [ "$local_attached" = "0" ]
	then
		tmux attach -t Local
	elif [ $aerospace_id = "10" ] && [ "$monitor_attached" = "0" ]
	then
		tmux attach -t Performance
	elif [ $aerospace_id = "3" ] && [ "$server_attached" = "0" ]
	then
		tmux attach -t Server
	fi
elif [ -n ${HYPRLAND_INSTANCE_SIGNATURE+x} ] && [ ! -v TMUX ]
then
	hypr_id=$(hyprctl activewindow -j | jq '.workspace.name')
	local_attached=$(tmux ls -F '#{session_name} #{session_attached}' | grep Local | awk '{print $2}')
	monitor_attached=$(tmux ls -F '#{session_name} #{session_attached}' | grep Performance | awk '{print $2}')
	server_attached=$(tmux ls -F '#{session_name} #{session_attached}' | grep Server | awk '{print $2}')
	if [ $hypr_id = "\"2\"" ] && [ "$local_attached" = "0" ]
	then
		tmux attach -t Local
	elif [ $hypr_id = "\"special:magic\"" ] && [ "$monitor_attached" = "0" ]
	then
		tmux attach -t Performance
	elif [ $hypr_id = "\"3\"" ] && [ "$server_attached" = "0" ]
	then
		tmux attach -t Server
	fi
elif [ "$XDG_SESSION_TYPE" = "wayland" ] && [ ! -v TMUX ]
then
	sway_id=$(swaymsg -t get_workspaces | jq '.[] | select(.focused==true) | .num')
	local_attached=$(tmux ls -F '#{session_name} #{session_attached}' | grep Local | awk '{print $2}')
	monitor_attached=$(tmux ls -F '#{session_name} #{session_attached}' | grep Performance | awk '{print $2}')
	server_attached=$(tmux ls -F '#{session_name} #{session_attached}' | grep Server | awk '{print $2}')
	if [ "$sway_id" = "2" ] && [ "$local_attached" = "0" ]
	then
		tmux attach -t Local
	elif [ "$sway_id" = "10" ] && [ "$monitor_attached" = "0" ]
	then
		tmux attach -t Performance
	elif [ "$sway_id" = "3" ] && [ "$server_attached" = "0" ]
	then
		tmux attach -t Server
	fi
fi

# RUST BINDINGS -----------------------------------------------------------
#if command -v rustc >/dev/null 2>&1; then
        #source "$(rustc --print sysroot)"/share/zsh/site-functions/_cargo
#fi

# find /Users/ashleyx/git -name ".DS_Store" -depth -exec rm {} \;


HISTFILE=~/.cache/.histfile
HISTSIZE=10000
SAVEHIST=50000
HISTDUP=erase
setopt beep notify
setopt sharehistory
setopt appendhistory
setopt hist_ignore_space
setopt hist_ignore_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

unsetopt autocd extendedglob nomatch


bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^ ' autosuggest-accept

source $ZDOTDIR/.zsh_aliases
source $ZDOTDIR/.zshenv
# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
eval "$(oh-my-posh init zsh --config ~/.config/omp_config.toml)"
