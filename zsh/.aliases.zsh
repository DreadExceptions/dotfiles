# ls aliases
alias ls="ls --color"
alias ll="ls -Al"
alias la="ls -A"
alias l="ls -F"
alias sl="ls"  

# directory switch aliases
alias ..="cd .."
alias ..2="cd ../.." 
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."

# security related aliases
alias disableaslr="setarch x86_64 -R /bin/bash"
alias objdump="objdump -M intel"

# ~/dotfiles/bin related aliases
alias tododot="grep --color=always --exclude=.p10k.zsh -ri 'TODO' ${HOME}/dotfiles"
alias notes="noglob $HOME/.local/bin/notes"
alias wtoday="weather -d 1 -n"

# miscellanous aliases
alias hg="history | grep"
alias c="clear"
alias ta="tmux a -t" 
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias grep="grep --color=always"
alias bat="batcat"
alias qrencode="noglob qrencodef"

# functions
qrencodef() {printf "$1" | curl -F-=\<- qrenco.de}
path2clip() { readlink -e "$1" | xclip -selection clipboard  }
wdx-ls-verbose() {
for point in $(wdx ls | tr "\n" " "); do
	ppath=$(wdx show "$point")
	echo "$point -> $ppath"
done
} 
