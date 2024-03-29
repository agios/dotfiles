#!/bin/zsh

# Prevent OSX from screwing up PATH
if (( $(uname) == "Darwin" )) ; then
  PATH=""
  source /etc/profile
fi

autoload -Uz compinit
compinit

setopt correct

export PATH="$HOME/bin:$PATH"

source <(antibody init)

antibody bundle robbyrussell/oh-my-zsh path:lib

# Load the theme.
antibody bundle mafredri/zsh-async

# Mac, homebrew needs to be loaded early
antibody bundle robbyrussell/oh-my-zsh path:plugins/brew

# Basic bundles
antibody bundle robbyrussell/oh-my-zsh path:plugins/git
antibody bundle robbyrussell/oh-my-zsh path:plugins/git-flow-avh
antibody bundle robbyrussell/oh-my-zsh path:plugins/gitfast
antibody bundle robbyrussell/oh-my-zsh path:plugins/github
antibody bundle robbyrussell/oh-my-zsh path:plugins/dotenv
antibody bundle robbyrussell/oh-my-zsh path:plugins/z
if (( $+commands[tmux] )) ; then
  antibody bundle robbyrussell/oh-my-zsh path:plugins/tmux
  antibody bundle tmuxinator/tmuxinator path:completion
fi

# Ruby
# antibody bundle robbyrussell/oh-my-zsh path:plugins/rails

# Docker
antibody bundle robbyrussell/oh-my-zsh path:plugins/docker
antibody bundle robbyrussell/oh-my-zsh path:plugins/docker-compose

# Python
#antibody bundle robbyrussell/oh-my-zsh path:plugins/pip
#antibody bundle robbyrussell/oh-my-zsh path:plugins/python

# Node
#antibody bundle robbyrussell/oh-my-zsh path:plugins/coffee
#antibody bundle robbyrussell/oh-my-zsh path:plugins/node
#antibody bundle robbyrussell/oh-my-zsh path:plugins/npm

# Various
# antibody bundle robbyrussell/oh-my-zsh path:plugins/vagrant
antibody bundle robbyrussell/oh-my-zsh path:plugins/kubectl

antibody bundle sindresorhus/pure
antibody bundle zsh-users/zsh-syntax-highlighting
antibody bundle robbyrussell/oh-my-zsh path:plugins/asdf
antibody bundle robbyrussell/oh-my-zsh path:plugins/ssh-agent

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
