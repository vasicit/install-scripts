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
    echo 'alias kubectl="sudo microk8s kubectl"' >> /home/vladimirvasic20/.bash_aliases
    echo 'alias kc="sudo microk8s kubectl"' >> /home/vladimirvasic20/.bash_aliases
    touch /etc/ready
fi
