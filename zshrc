#!/bin/zsh

autoload -Uz compinit
compinit

source <(antibody init)

antibody bundle robbyrussell/oh-my-zsh folder:lib

# Load the theme.
antibody bundle mafredri/zsh-async

# Basic bundles
antibody bundle robbyrussell/oh-my-zsh folder:plugins/gitfast
antibody bundle robbyrussell/oh-my-zsh folder:plugins/github
antibody bundle robbyrussell/oh-my-zsh folder:plugins/command-not-found
if (( $+commands[tmux] )) ; then
	antibody bundle robbyrussell/oh-my-zsh folder:plugins/tmux
	antibody bundle tmuxinator/tmuxinator folder:completion
fi

# Ruby
# antibody bundle robbyrussell/oh-my-zsh folder:plugins/rails
antibody bundle robbyrussell/oh-my-zsh folder:plugins/heroku

# Docker
antibody bundle robbyrussell/oh-my-zsh folder:plugins/docker
antibody bundle robbyrussell/oh-my-zsh folder:plugins/docker-compose

# Python
#antibody bundle robbyrussell/oh-my-zsh folder:plugins/pip
#antibody bundle robbyrussell/oh-my-zsh folder:plugins/python
#antibody bundle robbyrussell/oh-my-zsh folder:plugins/virtualenv
#antibody bundle robbyrussell/oh-my-zsh folder:plugins/virtualenvwrapper

# Node
#antibody bundle robbyrussell/oh-my-zsh folder:plugins/coffee
#antibody bundle robbyrussell/oh-my-zsh folder:plugins/node
#antibody bundle robbyrussell/oh-my-zsh folder:plugins/npm

# Various
antibody bundle robbyrussell/oh-my-zsh folder:plugins/vagrant

# Mac
antibody bundle robbyrussell/oh-my-zsh folder:plugins/brew

antibody bundle sindresorhus/pure
antibody bundle zsh-users/zsh-syntax-highlighting
antibody bundle robbyrussell/oh-my-zsh folder:plugins/asdf

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
