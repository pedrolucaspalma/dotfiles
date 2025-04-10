export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(git)

PATH="/usr/local/texlive/2024/bin/x86_64-linux:$PATH"

source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'
export TERM=xterm-256color

export PATH=$PATH:/usr/local/go/bin
export GOROOT=/usr/local/go

export CGO_ENABLED=1

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
alias upd="sudo apt update && sudo apt upgrade -y && flatpak update -y"

# docker aliases
alias dcu="docker compose up -d && docker logs -f sticky-api"
alias dcd="docker compose stop"

# connecting to NAS (Raspberry Pi 4)
alias cnas="ssh pedro@nas"

# opening and syncing Obsidian
alias opob="cd ~/Developer/obsidian-notes && git pull && flatpak run md.obsidian.Obsidian && updob && cd ~"
alias updob="cd ~/Developer/obsidian-notes && git commit -a -m 'upd' && git push && cd ~"

#alias vim="/home/pedro/Developer/tt/tt nvim"

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
#

# Load private, untracked config
[[ -f "$HOME/.zshrc.private" ]] && source "$HOME/.zshrc.private"

# =============== Nuvidio variables =============
alias opvpn="sh /home/pedro/Developer/dotfiles/connect-vpn.sh"
