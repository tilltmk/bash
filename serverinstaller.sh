#!/bin/bash

# Update System
echo "Updating system..."
apt-get update && apt-get upgrade -y

# Install Docker
echo "Installing Docker..."
apt-get remove docker docker-engine docker.io containerd runc -y
apt-get install wget git apt-transport-https ca-certificates curl gnupg lsb-release -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io -y

# Enable Docker service
systemctl enable docker
systemctl start docker

# Install Docker Compose
echo "Installing Docker Compose..."
DOCKER_COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep -Po '"tag_name": "\K.*\d')
curl -L "https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# Enable automatic updates
echo "Enabling automatic updates..."
apt-get install unattended-upgrades -y
dpkg-reconfigure --priority=low unattended-upgrades

# Docker Volume and Portainer Setup
echo "Setting up Portainer..."
docker volume create portainer_data
docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest

# Docker Compose setup for Nginx Proxy Manager
echo "Setting up Nginx Proxy Manager with Docker Compose..."

# Create directory for Docker Compose file
mkdir -p /srv/nginx-proxy-manager
cd /srv/nginx-proxy-manager

# Create docker-compose.yaml file
cat <<EOF > docker-compose.yaml
version: '3.8'
services:
  app:
    image: 'jc21/nginx-proxy-manager:latest'
    restart: always
    ports:
      - '80:80'
      - '81:81'
      - '443:443'
    volumes:
      - ./data:/data
      - ./letsencrypt:/etc/letsencrypt
EOF

# Start Docker Compose
docker-compose up -d

echo "Server setup completed."
