#!/bin/bash

#Update the apt package index and install packages to allow apt to use a repository over HTTPS
apt-get update
apt-get -y install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
    
#Add Docker’s official GPG key
mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg -y --dearmor -o /etc/apt/keyrings/docker.gpg

#Set up the repository
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  
#Update the apt package index
apt-get update

#Install Docker Engine, containerd, and Docker Compose
apt-get -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin

#Install with curl --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/vasicit/install-scripts/master/install-docker-compose-ubuntu.sh | sh
