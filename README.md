# dotfiles

my configuration files, taken from https://medium.com/toutsbrasil/how-to-manage-your-dotfiles-with-git-f7aeed8adf8b

# prerequisites

```
sudo apt install git
sudo apt install curl
sudo apt install tmux
sudo apt install neofetch
curl -sLf https://spacevim.org/install.sh | bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh # uncheck modify path variable
sudo apt install zsh
chsh -s $(which zsh) 
# log out and log in to allow for change of default shell to happen
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo apt install -y make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev \
libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl \
git
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
```

Other useful but not required progs:
```
sudo apt install keepassxc
wget https://github.com/dvorka/mindforger/releases/download/1.52.0/mindforger_1.52.0-1_amd64.deb
sudo apt install ./mindforger_1.52.0-1_amd64.deb
rm ./mindforger_1.52.0-1_amd64.deb
```

## Setup

```
git init --bare $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.bashrc
```

## Usage

```
dotfiles status
dotfiles add .vimrc
dotfiles commit -m "Add vimrc"
dotfiles add .bashrc
dotfiles commit -m "Add bashrc"
dotfiles push
```

## Setup environment in a new computer

```
git clone --bare https://github.com/LorenzoAlluminio/dotfiles.git $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no
```

Note that if you already have some of the files you'll get an error message. You can either (1) delete them or (2) back them up somewhere else. It's up to you.

after setup, open vim to install the plugins.
