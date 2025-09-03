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

export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$PATH:$GEM_HOME/bin"


export PATH="$PATH:$HOME/.local/share/cargo/bin/"

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'


# RUST BINDINGS -----------------------------------------------------------
# if command -v rustc >/dev/null 2>&1; then
#         source "$(rustc --print sysroot)"/share/zsh/site-functions/_cargo
# fi

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
setopt noflowcontrol

unsetopt autocd extendedglob nomatch

function sesh-sessions() {
  {
    exec </dev/tty
    exec <&1
    local session
    session=$(sesh list -THtdz -c | fzf --ansi --height 40% --reverse --border-label ' sesh ' --border --prompt '⚡  ')
    zle reset-prompt > /dev/null 2>&1 || true
    [[ -z "$session" ]] && return
    sesh connect $session
  }
}

zle     -N             sesh-sessions
bindkey -M emacs '^s' sesh-sessions
bindkey -M vicmd '^s' sesh-sessions
bindkey -M viins '^s' sesh-sessions

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
