#!/bin/bash
#----------------------------------------
# Author: Lorenzo Alluminio
# Installs my base dev / hacking environment
# TODO:
# - add installation of emacs and alacritty from source
#----------------------------------------

# BE CAREFUL: CONTAINS UNTESTED CODE

# tools
sudo apt update
sudo apt install git
sudo apt install curl
sudo apt install tmux
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
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# zsh
sudo apt install zsh
chsh -s $(which zsh)

# stow
mkdir -p $HOME/bin
stow alacritty
stow bash
stow bin -t $HOME/bin
stow gdb
stow git
stow p10k
stow profile
stow source-highlight -t /usr/share/source-highlight/
stow tmux
stow vim
stow zsh
