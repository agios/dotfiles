skip_global_compinit=1

# Path for custom completions
fpath=(~/.zsh/completion $fpath)

PATH="/usr/local/sbin:$PATH"
PATH="$HOME/bin:$PATH"
PATH="$PATH:/Library/TeX/texbin"

export GOPATH=$HOME/go
PATH="$PATH:$GOPATH/bin"

export PATH

# Allow user set host aliases
export HOSTALIASES=~/.hosts

# Set terminal to 256 colors if using an xterm compatible term
if [[ "$TERM" =~ xterm.* ]]; then
  export TERM=xterm-256color
fi

export EDITOR=nvim
export LC_ALL=en_US.UTF-8

# Use ag for default fzf search
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
#export FZF_DEFAULT_OPTS='--exact'
