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
export OLLAMA_API_BASE=http://192.168.7.8:11434
export AIDER_EDITOR=vim


# aliases
alias lsalias="cat ~/.zshrc | grep 'alias '"

alias cnas="ssh pedro@192.168.7.201"

alias cdvim="cd ~/.config/nvim"
alias cdnvim="cd ~/.config/nvim"
alias cvim="cdvim && nvim ."
alias cnvim="cdvim && nvim ."
alias open="xdg-open"
alias opvpn="sudo openfortivpn -c /etc/openfortivpn/config"

alias czsh="nvim ~/.zshrc"

[[ -f "$HOME/.zshrc.private" ]] && source "$HOME/.zshrc.private"

# pnpm
export PNPM_HOME="/Users/pedro/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Created by `pipx` on 2025-12-08 16:37:30
export PATH="$PATH:/home/pedro/.local/bin"
