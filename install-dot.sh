#!\bin\bash

rm -rf ~/.config/nvim

# .zshrc
ln -sf ~/Developer/dotfiles/.zshrc ~/.zshrc

# tmux
ln -sf ~/Developer/dotfiles/.tmux.conf ~/.tmux.conf 

# wifi -> olhar wifi.md

# neovim configs
ln -sf ~/Developer/dotfiles/ ~/.config/nvim
ln -sf ~/Developer/dotfiles/nvim ~/.config/nvim

