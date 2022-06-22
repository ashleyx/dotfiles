
# EXPORTS -----------------------------------------------------------

setopt globdots

export LC_ALL=en_IN.UTF-8
export LANG=en_IN.UTF-8


export ZSH="$HOME/.oh-my-zsh"

export ZSH_TMUX_DEFAULT_SESSION_NAME="Local"
#export ZSH_TMUX_AUTOSTART=true
export ZSH_TMUX_AUTOQUIT=true


export VISUAL="nvim"
export EDITOR="$VISUAL"


# TMUX -----------------------------------------------------------

#SESSIONEXISTS=$(tmux list-sessions 2>/dev/null)
#if [ "$SESSIONEXISTS" = "" ]; then
	source $HOME/.tmux-setup.sh
	#echo "tmux sessions created"
#fi

if [ ! -v TMUX ] && [ "$TERM" = "alacritty" ] ; then
	tmux attach -t Local
elif [ ! -v TMUX ] && [ "$TERM" != "alacritty" ] ; then
	tmux attach -t Performance
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=50000
setopt beep notify
unsetopt autocd extendedglob nomatch
bindkey -e
# End of lines configured by zsh-newuser-install


source ~/installs/zsh-autocomplete/zsh-autocomplete.plugin.zsh

source ~/installs/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


plugins=(tmux)


# oh-my-zsh 

source $ZSH/oh-my-zsh.sh

# ALIASES -----------------------------------------------------------

# exa
alias ls='exa --long --icons --group-directories-first'
alias la='exa --long --icons --group-directories-first -a'
# nvim
alias v='nvim'
alias vi='nvim'

source $HOME/.zoxide



