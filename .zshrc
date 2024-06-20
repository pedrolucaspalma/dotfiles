# Created by newuser for 5.9
eval "$(starship init zsh)"

# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list '' \
▎ 'm:{a-z\-}={A-Z\_}' \
▎ 'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
▎ 'r:|?=** m:{a-z\-}={A-Z\_}'
# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

PATH="/usr/local/texlive/2024/bin/x86_64-linux:$PATH"

export EDITOR='nvim'
export TERM=xterm-256color

export PATH=$PATH:/usr/local/go/bin
export GOROOT=/usr/local/go

export NVM_DIR="$HOME/.nvm"
export CGO_ENABLED=1

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# list all aliases
alias lsalias="cat ~/.zshrc | grep 'alias '"

# updating system
alias yayf="yay -Syu  && flatpak update -y"
alias upd="sudo apt update && sudo apt upgrade -y && flatpak update -y"

# docker aliases
alias dcu="docker compose up -d && docker logs -f sticky-api"
alias dcd="docker compose stop"

# connecting to Banana Pi M5
# alias cnas="ssh pedro@192.168.1.200"

# connecting to Raspberry Pi 4
alias crasp="ssh pedro@192.168.1.201"

# opening and syncing Obsidian
alias opob="cd ~/Developer/obsidian-notes && git pull && flatpak run md.obsidian.Obsidian && updob && cd ~"

alias updob="cd ~/Developer/obsidian-notes && git commit -a -m 'upd' && git push && cd ~"

alias vim="/home/pedro/Developer/tt/tt nvim"

# editing and saving init.lua and other neovim config files
alias cdvim="cd ~/.config/nvim"

# editing and saving .zshrc
alias czsh="nvim ~/.zshrc"

alias opsticky="sh /home/pedro/Developer/dotfiles/tmux-scripts/opsticky.sh"
alias opmwro="sh /home/pedro/Developer/dotfiles/tmux-scripts/opmwro.sh"
alias optaxi="sh /home/pedro/Developer/dotfiles/tmux-scripts/optaxi.sh"

# pnpm
export PNPM_HOME="/home/pedro/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
