#____Vscode 
baixar no site

# ____NVM
#Rodar depois de instalar o zsh. 
#------>>>>QUANTO TERMINAR DE RODAR, REINICIAR O TERMINAL<<<--------
sudo curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
nvm install --lts
nvm use --lts

# ____Yarn
npm install --global yarn

# ____Docker olha la no site
# Reinicia o pc antes e depois do prox comando (rodar docker sem sudo)
sudo usermod -aG docker $(whoami)

# ____Docker-Compose
sudo curl -L https://github.com/docker/compose/releases/download/1.15.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose

Reinicia o pc antes e depois do prox comando
sudo chmod +x /usr/local/bin/docker-compose

# ____RVM e Ruby
# https://github.com/rvm/ubuntu_rvm
# https://rvm.io/rvm/install
