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
source /usr/local/bin/virtualenvwrapper.sh

# nvm 
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# environment variables
export PATH=$PATH:/home/ulla/.local/bin:/home/ulla/Apps

# aliases
alias zshconfig="vim ~/.zshrc && source ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh && source ~/.oh-my-zsh"
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias sl='ls'
alias ghidra='/home/ulla/ghidra_9.2.2_PUBLIC/ghidraRun'
alias battlescribe="/home/ulla/BattleScribe_2.03.21/RosterEditor.sh"
alias disableaslr="setarch x86_64 -R /bin/bash"
alias ida="/home/ulla/idafree-7.0/ida64"
alias hg="history | grep"
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias untar='tar -zxvf'
alias ..="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."
alias c="clear"
alias ta="tmux a -t"
alias objdump="objdump -M intel"
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

cs() { cd "$1" && ls; }

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# show neofetch prompt only if not in tmux
if [ -z ${TMUX} ]; then
	POWERLEVEL9K_INSTANT_PROMPT=quiet
	neofetch --cpu_temp C --memory_percent on
fi
