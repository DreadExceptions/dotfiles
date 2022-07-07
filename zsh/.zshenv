# rust binaries env
export RUSTUP_HOME=/opt/rust/rustup
export CARGO_HOME=/opt/rust/cargo
# allow syntax highlighting for less
export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
export LESS=" -R "
# set location variable
export LOCATIONLONG=$(cat $HOME/dotfiles/config/.location | sed '/^#/d' | cut -d "|" -f 1 | tr " " "+")
export LOCATIONSHORT=$(cat $HOME/dotfiles/config/.location | sed '/^#/d' | cut -d "|" -f 2)

# set correct keyboard layout
export EXTERNAL_KEYBOARD=$(xinput | grep "Cherry")
if [ -n "$EXTERNAL_KEYBOARD" ]; then
    setxkbmap us
else
    setxkbmap it
fi
