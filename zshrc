#!/bin/zsh

# Prevent OSX from screwing up PATH
# if (( $(uname) == "Darwin" )) ; then
#   PATH=""
#   source /etc/profile
# fi

autoload -Uz compinit
compinit

setopt correct

export PATH="$HOME/bin:$PATH"

zsh_plugins=${ZDOTDIR:-$HOME}/.zsh_plugins
source ${ZDOTDIR:-$HOME}/.antidote/antidote.zsh
if [[ ! ${zsh_plugins}.zsh -nt ${zsh_plugins}.txt ]]; then
  (
    antidote bundle <${zsh_plugins}.txt >${zsh_plugins}.zsh
  )
fi
source ${zsh_plugins}.zsh

if (( $+commands[tmux] )) ; then
  source <(antidote bundle ohmyzsh/ohmyzsh path:plugins/tmux)
  source <(antidote bundle tmuxinator/tmuxinator path:completion)
fi

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Aliases
[ -e "${HOME}/.zsh_aliases" ] && source "${HOME}/.zsh_aliases"

if [[ $- == *i* ]]; then # Running in an interactive shell
  # Disable XON/XOFF flow control with C-S/C-Q
  stty -ixon
  stty stop undef
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Created by `pipx` on 2025-01-21 14:12:18
export PATH="$PATH:/Users/agios/.local/bin"
