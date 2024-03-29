# skip_global_compinit=1

# Path for custom completions
fpath=(~/.zsh/completion $fpath)

# Remove the zsh completion shipped by Homebrew git.
# https://github.com/Homebrew/homebrew-core/issues/33275
[[ -f /usr/local/share/zsh/site-functions/_git ]] && \
  rm  -f /usr/local/share/zsh/site-functions/_git

PATH="/usr/local/sbin:$PATH"
PATH="$PATH:/Library/TeX/texbin"

export GOPATH=$HOME/go
PATH="$PATH:$GOPATH/bin"

export ANDROID_HOME=/usr/local/opt/android-sdk

export PATH

# Allow user set host aliases
export HOSTALIASES=~/.hosts

# Set terminal to 256 colors if using an xterm compatible term
if [[ "$TERM" =~ xterm.* ]]; then
  export TERM=screen-256color
fi

export EDITOR=nvim
export LC_ALL=en_US.UTF-8

# Use ag for default fzf search
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
#export FZF_DEFAULT_OPTS='--exact'

export ZSH_CACHE_DIR=~/.zsh/cache

DISABLE_AUTO_TITLE="true"

if [ -n "$TMUX" ]; then
  function refresh {
    sshauth=$(tmux show-environment | grep "^SSH_AUTH_SOCK")
    if [ $sshauth ]; then
      export $sshauth
    fi
    sshpid=$(tmux show-environment | grep "^SSH_AGENT_PID")
    if [ $sshpid ]; then
      export $sshpid
    fi
    display=$(tmux show-environment | grep "^DISPLAY")
    if [ $display ]; then
      export $display
    fi
  }
else
  function refresh { }
fi

function preexec {
  # Refresh environment if inside tmux
  refresh
}
