source ~/installs/zsh-autocomplete/zsh-autocomplete.plugin.zsh
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
	# TODO aerospace list-workspaces --focused
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


# POWERLVL10k -----------------------------------------------------------
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Lines configured by zsh-newuser-install
HISTFILE=~/.cache/.histfile
HISTSIZE=10000
SAVEHIST=50000
setopt beep notify
unsetopt autocd extendedglob nomatch
bindkey -e
# End of lines configured by zsh-newuser-install


source ~/installs/powerlevel10k/powerlevel10k.zsh-theme

source $ZDOTDIR/.zsh_aliases
source $ZDOTDIR/.zshenv
source <(fzf --zsh)
eval "$(zoxide init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

