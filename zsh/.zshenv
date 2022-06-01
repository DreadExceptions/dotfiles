# rust binaries env
export RUSTUP_HOME=/opt/rust/rustup
export CARGO_HOME=/opt/rust/cargo
# allow syntax highlighting for less
export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
export LESS=" -NR "
# set location variable
export LOCATION=$(cat $HOME/dotfiles/location/.location)
