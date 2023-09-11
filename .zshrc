export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(git docker docker-compose git jsontools)

source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'

export NVM_DIR="$HOME/.nvm"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# list all aliases
alias lsalias="cat ~/.zshrc | grep 'alias '"

# updating system
alias yayf="yay -Syu  && flatpak update -y"

# docker aliases
alias dcu="docker compose up -d && docker logs -f sticky-api"
alias dcd="docker compose stop"

# connecting to private NAS
alias cnas="ssh pedro@192.168.1.200"

# opening and syncing Obsidian
alias opob="cd ~/Developer/obsidian-notes && git pull && flatpak run md.obsidian.Obsidian && updob && cd ~"
alias updob="cd ~/Developer/obsidian-notes && git add . && git commit -a -m 'upd' && git push && cd ~"

# editing and saving init.lua
alias cvim="nvim ~/.config/nvim/init.lua"
alias svim="cd ~/Developer/dotfiles-e-scripts/ && git pull && cp ~/.config/nvim/init.lua . && git add . && git commit -m 'upd init.lua' && git push"

# editing and saving .zshrc
alias czsh="nvim ~/.zshrc"
alias szsh="cd ~/Developer/dotfiles-e-scripts/ && git pull && cp ~/.zshrc . && git add .zshrc && git commit -m 'upd .zshrc' && git push"

# updates the local dotfiles repo and updates all dotfiles from remote. Note: needs to be updated each time a new dotfile is added.
alias udot="cd ~/Developer/dotfiles-e-scripts/ && git pull && cp ./.zshrc ~ && cp ./init.lua ~/.config/nvim"

# NNN
alias n="nnn -e"
