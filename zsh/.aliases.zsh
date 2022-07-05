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
alias tododot="grep --color=always --exclude=.p10k.zsh -ri 'TODO' ${HOME}/dotfiles"
alias grep="grep --color=always"
alias bat="batcat"
alias notes="noglob $HOME/bin/notes"
alias wtoday="weather -d 1 -n"

# functions
path2clip() { readlink -e "$1" | xclip -selection clipboard  }
wdx-ls-verbose() {
for point in $(wdx ls | tr "\n" " "); do
	ppath=$(wdx show "$point")
	echo "$point -> $ppath"
done
} 
