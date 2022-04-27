# enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# path to your oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# theme to load
ZSH_THEME="powerlevel10k/powerlevel10k"

# update without prompting each 7 days
DISABLE_UPDATE_PROMPT="true"
export UPDATE_ZSH_DAYS=7

# command execution timestamps format
HIST_STAMPS="dd.mm.yyyy"

# plugins to load
plugins=(git zsh-autosuggestions pyenv)

source $ZSH/oh-my-zsh.sh
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
source /usr/local/bin/virtualenvwrapper.sh

# nvm 
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# environment variables
export PATH=$PATH:$HOME/.local/bin:$HOME/Apps:$HOME/Android/Sdk/platform-tools:$HOME/Android/Sdk/build-tools/31.0.0:$HOME/Android/Sdk/emulator:$HOME/Android/Sdk/tools:$HOME/Android/Sdk/tools/bin

# aliases
alias zshconfig="vim ~/.zshrc && source ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh && source ~/.oh-my-zsh"
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias sl='ls'
alias ghidra="$HOME/ghidra_10.1.1_PUBLIC/ghidraRun"
alias disableaslr="setarch x86_64 -R /bin/bash"
alias ida="$HOME/Apps/ida/ida"
alias hg="history | grep"
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias ..="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."
alias c="clear"
alias ta="tmux a -t"
alias objdump="objdump -M intel"
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias baksmali="java -jar $HOME/Apps/baksmali-2.5.2.jar"
alias smali="java -jar $HOME/Apps/smali-2.5.2.jar"
alias dirbuster="$HOME/Apps/dirbuster/DirBuster-1.0-RC1.sh"
alias jadx="$HOME/Apps/jadx/bin/jadx-gui"
alias backlogs="find ${HOME}/mindforger-repos -type f -iname "backlog.md" -exec batcat --paging always {} \;"
alias bl="backlogs"
alias ms="mindsearch"
alias msc="mindsearchcontext"

mindsearch() { par="$@"; /usr/bin/grep -E -ri "$par" --color=always ${HOME}/mindforger-repos | less}
# TODO do this in a proper way (e.g. with a parameter)
mindsearchcontext() { par="$@"; /usr/bin/grep -C 2 -E -ri "$par" --color=always ${HOME}/mindforger-repos | less}
cs() { cd "$1" && ls; }
path2clip() { readlink -e "$1" | xclip -selection clipboard  }
pformat() { echo "$@" | tr " \n" "-" | tr '[:upper:]' '[:lower:]' | sed 's/-$//' | xclip -sel clip }

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# show neofetch prompt only if not in tmux
if [ -z ${TMUX} ]; then
	POWERLEVEL9K_INSTANT_PROMPT=quiet
	neofetch --cpu_temp C --memory_percent on
fi
eval "$(pyenv init -)"
eval $(thefuck --alias)
