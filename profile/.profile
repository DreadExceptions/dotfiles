# executed on login

# set xdg configuration
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# /opt
export CARGO_HOME="/opt/rust/cargo"
export RUSTUP_HOME="/opt/rust/rustup"

# XDG_CONFIG_HOME (~/.config)
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export TEXMFCONFIG="$XDG_CONFIG_HOME/texlive/texmf-config"

# XDG_DATA_HOME (~/.local/share)
export GOENV_GOPATH_PREFIX="$XDG_DATA_HOME/go"
export ANDROID_HOME="$XDG_DATA_HOME/android" # adb will still ignore this ¯\_(ツ)_/¯
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
export PYENV_HOME="$XDG_DATA_HOME/pyenv" # needed for mattberther/zsh-pyenv plugin
export NODENV_ROOT="$XDG_DATA_HOME/nodenv" 
export NODENV_HOME="$XDG_DATA_HOME/nodenv" # needed for mattberther/zsh-nodenv plugin
export GOENV_ROOT="$XDG_DATA_HOME/goenv"
export TEXMFHOME="$XDG_DATA_HOME/texmf"

# XDG_STATE_HOME (~/.local/state)
export HISTFILE="$XDG_STATE_HOME/bash/history"
export GDBHISTFILE="$XDG_STATE_HOME/gdb/history" # gef overrides this
export NODE_REPL_HISTORY="$XDG_STATE_HOME/nodejs/node_repl_history"
export LESSHISTFILE="$XDG_STATE_HOME/less/history"

# XDG_CACHE_HOME (~/.cache)
export CCACHE_DIR="$XDG_CACHE_HOME/ccache"
export TEXMFVAR="$XDG_CACHE_HOME/texlive/texmf-var"

# python history hack for xdg compliance
export PYTHONSTARTUP=$XDG_CONFIG_HOME/python/pythonrc

# viminit hack for xdg compliance
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'

# allow syntax highlighting for less
export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
export LESS=" -R "

# set location variable
export LOCATIONLONG=$(cat "$XDG_DATA_HOME/dotfiles/info/location" | sed '/^#/d' | cut -d "|" -f 1 | tr " " "+")
export LOCATIONSHORT=$(cat "$XDG_DATA_HOME/dotfiles/info/location" | sed '/^#/d' | cut -d "|" -f 2)

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$XDG_CONFIG_HOME/bash/bashrc" ]; then
	      . "$XDG_CONFIG_HOME/bash/bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# include wrappers if they exist
if [ -d "$HOME/.local/wrappers" ] ; then
    PATH="$HOME/.local/wrappers:$PATH"
fi

# include xdgwrappers if they exist
if [ -d "$HOME/.local/xdgwrappers" ] ; then
    PATH="$HOME/.local/xdgwrappers:$PATH"
fi

# include optional binaries
if [ -d "/opt/bin" ] ; then
    PATH="/opt/bin:$PATH"
fi

# execute additional commands if present
if [ -f "$XDG_DATA_HOME/dotfiles/profile/addition_profile.sh"]; then
    $XDG_DATA_HOME/dotfiles/profile/addition_profile.sh
fi
# include go env binary
export PATH="$GOENV_ROOT/bin:$PATH"
