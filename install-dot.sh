#!\bin\bash


# .zshrc
rm -rf ~/.zshrc
ln -sf ~/Developer/dotfiles/.zshrc ~/.zshrc

# tmux
rm -rf ~/.tmux.conf
ln -sf ~/Developer/dotfiles/.tmux.conf ~/.tmux.conf 

# wifi -> olhar wifi.md

# neovim configs
rm -rf ~/.config/nvim
ln -sf ~/Developer/dotfiles/nvim ~/.config/nvim

