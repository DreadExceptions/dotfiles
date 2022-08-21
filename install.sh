#!/bin/bash
#----------------------------------------
# Author: Lorenzo Alluminio
# Installs my base dev / hacking environment
# TODO:
# - rust install probably missing a stow command (as well as after atuin install)
# - add installation of emacs, alacritty and gocryptfs from source
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
stow tmux
stow vim
stow zsh
sudo rm /usr/share/source-highlight/src-hilite-lesspipe.sh
sudo stow source-highlight -t /usr/share/source-highlight/
