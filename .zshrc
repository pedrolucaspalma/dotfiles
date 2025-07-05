export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(git)
source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'
export TERM=xterm-256color

export CGO_ENABLED=1

export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

# aliases
alias lsalias="cat ~/.zshrc | grep 'alias '"

alias cnas="ssh pedro@nas"

alias cdvim="cd ~/.config/nvim"
alias cdnvim="cd ~/.config/nvim"
alias cvim="cdvim && nvim ."
alias cnvim="cdvim && nvim ."

alias czsh="nvim ~/.zshrc"

[[ -f "$HOME/.zshrc.private" ]] && source "$HOME/.zshrc.private"

# pnpm
export PNPM_HOME="/Users/pedro/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export PATH="/opt/homebrew/opt/node@22/bin:$PATH"
