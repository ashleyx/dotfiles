# TMUX -----------------------------------------------------------

source $ZDOTDIR/.tmux-setup.sh

if [ ! -v TMUX ] && [ "$TERM" = "alacritty" ] ; then
	tmux attach -t Local
elif [ ! -v TMUX ] && [ "$TERM" != "alacritty" ] ; then
	tmux attach -t Performance
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
