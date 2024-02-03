export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(git docker docker-compose git jsontools)

source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'
export TERM=xterm-256color

# initialise completions with ZSH's compinit

autoload -Uz compinit && compinit
export PATH=$PATH:/usr/local/go/bin
export GOROOT=/usr/local/go

export NVM_DIR="$HOME/.nvm"
export CGO_ENABLED=1

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# NNN cd on quit

n ()
{
    # Block nesting of nnn in subshells
    [ "${NNNLVL:-0}" -eq 0 ] || {
        echo "nnn is already running"
        return
    }

    # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
    # If NNN_TMPFILE is set to a custom path, it must be exported for nnn to
    # see. To cd on quit only on ^G, remove the "export" and make sure not to
    # use a custom path, i.e. set NNN_TMPFILE *exactly* as follows:
    #      NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    # The command builtin allows one to alias nnn to n, if desired, without
    # making an infinitely recursive alias
    command nnn "$@"

    [ ! -f "$NNN_TMPFILE" ] || {
        . "$NNN_TMPFILE"
        rm -f "$NNN_TMPFILE" > /dev/null
    }
}

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
alias opob="
    cd ~/Developer/obsidian-notes &&
    git pull &&
    flatpak run md.obsidian.Obsidian &&
    updob &&
    cd ~"

alias updob="
    cd ~/Developer/obsidian-notes 
    git commit -a -m 'upd' &&
    git push &&
    cd ~
    "

# editing and saving init.lua and other neovim config files
alias cdvim="cd ~/.config/nvim"

# editing and saving .zshrc
alias czsh="nvim ~/.zshrc"

# pnpm
export PNPM_HOME="/home/pedro/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
