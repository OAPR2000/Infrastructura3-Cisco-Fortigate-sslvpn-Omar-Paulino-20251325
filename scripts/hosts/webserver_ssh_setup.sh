#!/bin/bash
# WEBSERVER-1325 - Habilitar SSH con contrasena y crear el usuario omar
sudo systemctl status ssh --no-pager
sudo adduser omar            # contrasena: Omar2025-1325
echo 'PasswordAuthentication yes' | sudo tee /etc/ssh/sshd_config.d/01-lab.conf
sudo systemctl restart ssh
# Verificacion
cat /etc/ssh/sshd_config.d/01-lab.conf
id omar
ssh omar@localhost
