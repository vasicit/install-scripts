#! /bin/bash
FILE=/etc/ready
if [ -f "$FILE" ]; then
    apt update 
    apt -y upgrade
else 
    apt update
    apt -y upgrade
    apt -y install vim
    snap install microk8s --classic
    microk8s enable dns dashboard storage ingress
    find /home/ -type d -exec touch {}/.bash_aliases \;
    find /home/ -type d -exec echo 'alias kubectl="sudo microk8s kubectl"' >> {}/.bash_aliases \;
    find /home/ -type d -exec echo 'alias kc="sudo microk8s kubectl"' >> {}/.bash_aliases \;
    touch /etc/ready
fi
