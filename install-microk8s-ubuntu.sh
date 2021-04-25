#! /bin/bash
# Check for flag file for script to know whether it has been executed before
FILE=/etc/ready
if [ -f "$FILE" ]; then
    apt update 
    apt -y upgrade
else 
    # Update OS, install microk8s and enable plugins 
    apt update
    apt -y upgrade
    apt -y install vim
    snap install microk8s --classic
    microk8s enable dns dashboard storage ingress
    # Create bash aliases files in all home directories and append alias lines for easier kubectl usage
    find /home/ -type d -exec touch {}/.bash_aliases \;
    for file in /home/*/.bash_aliases
    do
    echo 'alias kc="sudo microk8s kubectl"' >> "$file"
    echo 'alias kubectl="sudo microk8s kubectl"' >> "$file"    
    done
    # Set flag file for script to know whether it has been executed before
    touch /etc/ready
fi
