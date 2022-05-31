alias zshconfig="vim ~/.zshrc && source ~/.zshrc"
alias ls="ls --color"
alias ll="ls -alF"
alias la="ls -A"
alias l="ls -CF"
alias sl="ls"    
alias disableaslr="setarch x86_64 -R /bin/bash"
alias hg="history | grep"
alias untar='tar -zxvf'
alias ..="cd .."
alias ..2="cd ../.." 
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."
alias c="clear"
alias ta="tmux a -t" 
alias objdump="objdump -M intel"
# usage: sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias backlogs="find ${HOME}/cryptomator_mnts/mindforger-repos -type f -iname "backlog.md" -exec batcat --paging always {} \;"
alias bl="backlogs"
alias ms="mindsearch"
alias msc="mindsearchcontext"
alias dotfilestodo="grep --color=always -ri 'TODO' ."
alias grep="grep --color=always"
alias bat="batcat"
alias notes="noglob $HOME/bin/notes"

# functions

mindsearch() { par="$@"; /usr/bin/grep -E -ri "$par" --color=always ${HOME}/cryptomator_mnts/mindforger-repos | less -r}
# TODO do this in a proper way (e.g. with a parameter for the context)
mindsearchcontext() { par="$@"; /usr/bin/grep -C 2 -E -ri "$par" --color=always ${HOME}/cryptomator_mnts/mindforger-repos | less -r}
cs() { cd "$1" && ls; }
path2clip() { readlink -e "$1" | xclip -selection clipboard  }
pformat() { echo "$@" | tr " \n" "-" | tr '[:upper:]' '[:lower:]' | sed 's/-$//' | xclip -sel clip }
