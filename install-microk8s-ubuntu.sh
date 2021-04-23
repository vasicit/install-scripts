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
    for folder in /home/
    do
      echo 'alias kubectl="sudo microk8s kubectl"' >> $folder/.bash_aliases
      echo 'alias kc="sudo microk8s kubectl"' >> $folder/.bash_aliases
    done
    touch /etc/ready
fi
