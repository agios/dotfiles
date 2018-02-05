source $HOME/.antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Load the theme.
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure

# Basic bundles
antigen bundle gitfast
antigen bundle github
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle rupa/z # jump around!
if (( $+commands[tmux] )) ; then
  antigen bundle tmux
  antigen bundle tmuxinator/tmuxinator completion/tmuxinator.zsh
fi

# Ruby
antigen bundle rbenv
antigen bundle rails
antigen bundle capistrano
#antigen bundle heroku

# Docker
antigen bundle docker
antigen bundle docker-compose

# Python
#antigen bundle pip
#antigen bundle python
#antigen bundle virtualenv
#antigen bundle virtualenvwrapper

# Node
#antigen bundle coffee
#antigen bundle node
#antigen bundle npm

# Various
antigen bundle vagrant

# Mac
antigen bundle brew

# Tell antigen that you're done.
antigen apply

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
