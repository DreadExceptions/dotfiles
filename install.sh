#!/bin/bash
#----------------------------------------
# Author: Lorenzo Alluminio
# Installs my base dev / hacking environment
# TODO:
# - rust install probably missing a stow command (as well as after atuin install)
# - add installation of emacs, alacritty, gocryptfs, mupdf, glow and tmux from source
# - before running the script, make sure that the xdg directories are set since I use them
#----------------------------------------

# BE CAREFUL: CONTAINS UNTESTED CODE

# tools
sudo apt update
sudo apt install git
sudo apt install gcc
sudo apt install make
sudo apt install xclip
sudo apt install pandoc
sudo apt install spell
sudo apt install texlive-full
sudo apt install curl
sudo apt install neofetch
sudo apt install keepassxc
sudo apt install vim
sudo apt install tlp
sudo tlp start
sudo apt install etckeeper
sudo apt install stow
sudo apt install source-highlight

# rust install
export RUSTUP_HOME=/opt/rust/rustup 
export CARGO_HOME=/opt/rust/cargo 
sudo mkdir -p /opt/rust
sudo chown $USER:$USER /opt/rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# atuin
cargo install atuin

# vim
curl -fLo "$XDG_CONFIG_HOME/vim/autoload/plug.vim" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# zsh
sudo apt install zsh
chsh -s $(which zsh)

# stow
stow alacritty -t $XDG_CONFIG_HOME/alacritty/
stow bash -t $XDG_CONFIG_HOME/bash
stow bin -t $HOME/.local/bin
stow emacs -t $XDG_CONFIG_HOME/emacs
stow gdb -t $XDG_CONFIG_HOME/gdb
stow git -t $XDG_CONFIG_HOME/git
stow p10k -t $XDG_CONFIG_HOME/zsh
stow python -t $XDG_CONFIG_HOME/python
stow profile -t $HOME
stow tmux -t $XDG_CONFIG_HOME/tmux
stow npm -t $XDG_CONFIG_HOME/npm
stow vim -t $XDG_CONFIG_HOME/vim
stow zsh -t $XDG_CONFIG_HOME/zsh
sudo rm /usr/share/source-highlight/src-hilite-lesspipe.sh
sudo stow source-highlight -t /usr/share/source-highlight/
