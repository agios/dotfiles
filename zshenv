skip_global_compinit=1

# Path for custom completions
fpath=(~/.zsh/completion $fpath)

PATH="$HOME/bin:$PATH"

export GOPATH=$HOME/go
PATH="$PATH:$GOPATH/bin"

export PATH

# Allow user set host aliases
export HOSTALIASES=~/.hosts

# Set terminal to 256 colors if using an xterm compatible term
if [[ "$TERM" =~ xterm.* ]]; then
  export TERM=gnome-256color
fi

# Use ag for default fzf search
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
#export FZF_DEFAULT_OPTS='--exact'
