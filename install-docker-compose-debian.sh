#!/bin/sh

# Update Debian
apt-get -y update && apt-get -y upgrade

# Uninstall old versions of Docker
apt-get remove docker docker-engine docker.io containerd runc

# Install necessary software for setting up Docker repository
apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
    
# Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

# Set up Stable Docker repository
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
   
# Install Docker engine
apt-get update && apt-get install docker-ce docker-ce-cli containerd.io

# Verify successful Docker engine installation with HelloWorld
docker run hello-world

# Install Docker Compose
curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
