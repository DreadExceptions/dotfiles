# executed on login

# set xdg configuration
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# clean home directory
# thanks https://github.com/b3nj5m1n/xdg-ninja
export CARGO_HOME="/opt/rust/cargo"
export RUSTUP_HOME="/opt/rust/rustup"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME/java"
export ANDROID_HOME="$XDG_DATA_HOME/android" # adb will still ignore this ¯\_(ツ)_/¯
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
export PYENV_HOME="$XDG_DATA_HOME/pyenv" # needed for mattberther/zsh-pyenv plugin
export NODENV_ROOT="$XDG_DATA_HOME/nodenv" 
export NODENV_HOME="$XDG_DATA_HOME/nodenv" # needed for mattberther/zsh-nodenv plugin
export HISTFILE="$XDG_STATE_HOME/bash/history"
export GDBHISTFILE="$XDG_STATE_HOME/gdb/history" # gef overrides this
export NODE_REPL_HISTORY="$XDG_STATE_HOME/nodejs/node_repl_history"
export LESSHISTFILE="$XDG_STATE_HOME/less/history"
export CCACHE_DIR="$XDG_CACHE_HOME/ccache"

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# include optional binaries
if [ -d "/opt/bin" ] ; then
    PATH="/opt/bin:$PATH"
fi
