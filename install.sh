#!/bin/bash
#----------------------------------------
# Author: Lorenzo Alluminio
# Installs my base dev / hacking environment
# TODO:
# - add emacs
# - install rustc
# - install alacritty from source
#----------------------------------------

# BE CAREFUL: UNTESTED CODE

# tools
sudo apt install git
sudo apt install curl
sudo apt install tmux
sudo apt install neofetch
sudo apt install keepassxc
sudo apt install vim
sudo apt install tlp
sudo tlp start
sudo add-apt-repository ppa:hluk/copyq
sudo apt update
sudo apt install copyq
sudo apt install etckeeper
sudo apt install stow
sudo apt install source-highlight

# vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# zsh
sudo apt install zsh
chsh -s $(which zsh)

# stow
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
