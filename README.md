# dotfiles

my configuration files and procedures on how to setup my env on a clean ubuntu installation.
Inspiration from https://medium.com/toutsbrasil/how-to-manage-your-dotfiles-with-git-f7aeed8adf8b.

# prerequisites

```
sudo apt install git
```

## Setup

```
git init --bare $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.bashrc
```

## Usage example

```
dotfiles status
dotfiles add .vimrc
dotfiles commit -m "Add vimrc"
dotfiles add .bashrc
dotfiles commit -m "Add bashrc"
dotfiles push
```

## Setup environment in a new computer

Stuff to install:
```
sudo apt install curl
sudo apt install tmux
sudo apt install neofetch
sudo apt install vim
curl -sLf https://spacevim.org/install.sh | bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# uncheck modify path variable in rust installation
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh 
sudo apt install zsh
chsh -s $(which zsh) 
# log out and log in to allow for change of default shell to happen
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
p10k configure
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
sudo apt install -y make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev \
libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl \
git
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
```

Sometimes the config of pyenv in the `.profile` file needs some tweaking. Also the source virtualenvwrapper.sh.

Other useful but not required progs:
```
sudo apt install keepassxc
wget https://github.com/dvorka/mindforger/releases/download/1.52.0/mindforger_1.52.0-1_amd64.deb
sudo apt install ./mindforger_1.52.0-1_amd64.deb
rm ./mindforger_1.52.0-1_amd64.deb
sudo apt install python3-pip
sudo apt install python2
wget https://bootstrap.pypa.io/pip/2.7/get-pip.py
python2 get-pip.py
sudo pip3 install virtualenv virtualenvwrapper
pip3 install ipython ipdb
python2 -m pip install ipython
sudo add-apt-repository ppa:hluk/copyq
sudo apt update
sudo apt install copyq
sudo apt install tlp
sudo tlp start
```

Actually get the dotfiles:

```
git clone --bare https://github.com/LorenzoAlluminio/dotfiles.git $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no
```

Note that if you already have some of the files you'll get an error message. You can either (1) delete them or (2) back them up somewhere else. It's up to you.

Other things to do:
- generate ssh key for github and setup .ssh/config file
- copyq
	- open with ctrl+e
	- autostart
	- avoid storing keepassxc passwords (https://superuser.com/questions/1112970/prevent-copyq-clipboard-manager-from-keeping-data-from-keepass)
- open vim to install plugins
- enable hibernate if possible
