#!/bin/sh

# Enable IP Forwarding
echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.conf
/sbin/sysctl -p

# Remove any previously installations of Docker
yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine

# Install the yum-utils package (which provides the yum-config-manager utility) and set up the stable repository.
yum install -y yum-utils

# Add Docker repository
yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
    
# Install Docker
yum -y --nobest install docker-ce docker-ce-cli containerd.io

# Enable Docker service at startup
systemctl enable --now docker

# Show Docker version to confirm installation
docker -v

# Download Docker Compose and place in bin directory
curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Make docker-compose executable
chmod +x /usr/local/bin/docker-compose

# Verify installation by showing docker-compose version
docker-compose -v






