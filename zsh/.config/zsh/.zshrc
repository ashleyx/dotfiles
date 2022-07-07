# TMUX -----------------------------------------------------------

source $ZDOTDIR/.tmux-setup.sh


if [ "$XDG_SESSION_TYPE" = "wayland" ] && [ ! -v TMUX ]
then
	sway_id=$(swaymsg -t get_workspaces | jq '.[] | select(.focused==true) | .num')
	if [ "$sway_id" = "2" ]
	then
		tmux attach -t Local
	elif [ "$sway_id" = "10" ]
	then
		tmux attach -t Performance
	fi
fi



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


source ~/installs/zsh-autocomplete/zsh-autocomplete.plugin.zsh

source ~/installs/powerlevel10k/powerlevel10k.zsh-theme

source $ZDOTDIR/.zsh_aliases

source $ZDOTDIR/.zoxide

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
