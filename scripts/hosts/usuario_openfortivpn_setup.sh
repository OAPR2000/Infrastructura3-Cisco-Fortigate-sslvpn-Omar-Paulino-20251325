#!/bin/bash
# Usuario - instalar y configurar el cliente SSL-VPN
sudo apt install -y openfortivpn traceroute
# Copiar el archivo de configuracion de este repo
sudo cp openfortivpn_config /etc/openfortivpn/config
# Conectar (en primer plano; Ctrl+C para desconectar)
sudo openfortivpn
# Comando equivalente sin archivo de configuracion:
# sudo openfortivpn 200.25.13.25:10443 -u omar-vpn --insecure-ssl --min-tls=1.0 --cipher-list=DEFAULT:@SECLEVEL=0
