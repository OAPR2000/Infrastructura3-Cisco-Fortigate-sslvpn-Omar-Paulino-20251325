#!/bin/bash
# 1) SIN VPN: la web publica funciona, el SSH no
curl -k https://200.25.13.25
sudo traceroute -I 200.25.13.25
ssh -o ConnectTimeout=5 omar@10.13.25.130     # debe fallar (timeout)
ssh -o ConnectTimeout=5 omar@200.25.13.25     # debe fallar (puerto 22 no publicado)

# 2) CON VPN (en otra consola o en segundo plano):
#    sudo openfortivpn &
ip a show ppp0                                # IP del pool 10.25.13.10-20
ip route | grep ppp0                          # 10.13.25.128/28 por ppp0 (split tunnel)
sudo traceroute -I 10.13.25.130
ssh omar@10.13.25.130                         # entra al servidor

# 3) VPN APAGADA otra vez
#    sudo pkill openfortivpn
ssh -o ConnectTimeout=5 omar@10.13.25.130     # vuelve a fallar
curl -k https://200.25.13.25                  # la web sigue funcionando
