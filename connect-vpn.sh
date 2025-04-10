#! bin/zsh
sudo openfortivpn new-vpn.nuvidio.com:4433 --trusted-cert=4abc752bf85eeadf6f8894eeacc1bdd15899c10be85ebdcf19a852dff4cb5076 --cookie=$(openfortivpn-webview new-vpn.nuvidio.com:4433 | sed -n 's/^SVPNCOOKIE=\(.*\)$/\1/p')
