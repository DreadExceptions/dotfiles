# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# install zinit if not present
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

# load zinit
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# load zinit extensions
# https://zdharma-continuum.github.io/zinit/wiki/Annexes/
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

# light load powerlevel10k theme
zinit ice depth"1"
zinit light romkatv/powerlevel10k

# ls colors
# https://zdharma-continuum.github.io/zinit/wiki/LS_COLORS-explanation/ 
zinit ice atclone"dircolors -b LS_COLORS > clrs.zsh" \
    atpull'%atclone' pick"clrs.zsh" nocompile'!' \
    atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”'
zinit light trapd00r/LS_COLORS

# turbo load basic setup (fast-syntax-highlighting, zsh-autosuggestions and zsh-completions)
# https://zdharma-continuum.github.io/zinit/wiki/Example-Minimal-Setup/
zinit ice wait lucid atinit"zicompinit; zicdreplay"
zinit load zdharma-continuum/fast-syntax-highlighting
zinit ice wait lucid atload"_zsh_autosuggest_start"
zinit load zsh-users/zsh-autosuggestions
zinit ice blockf atpull'zinit creinstall -q .'
zinit load zsh-users/zsh-completions

# turbo load additional plugins
zinit ice wait lucid
zinit load MichaelAquilina/zsh-you-should-use
zinit ice wait lucid
zinit load Tarrasch/zsh-command-not-found
zinit ice wait'1' lucid
zinit load laggardkernel/zsh-thefuck

# turbo load atuin
export ATUIN_NOBIND="true"
zinit ice wait lucid
zinit load ellie/atuin
bindkey '^r' _atuin_search_widget

# turbo load nodenv and pyenv
zinit ice wait lucid
zinit load mattberther/zsh-nodenv
zinit ice wait lucid
zinit load mattberther/zsh-pyenv

# enable tab completion menu
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

# source environment variables
if [ -f "$HOME/.zshenv" ]; then
	source $HOME/.zshenv
fi

# source aliases
if [ -f "$HOME/.aliases.zsh" ]; then
	source $HOME/.aliases.zsh
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval "$(atuin init zsh)"
