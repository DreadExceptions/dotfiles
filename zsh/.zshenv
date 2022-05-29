# rust binaries env
export RUSTUP_HOME=/opt/rust/rustup
export CARGO_HOME=/opt/rust/cargo
# allow syntax highlighting for less
# TODO fix spaces interpreted as tabs due to alacritty
export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
export LESS=" -R "
