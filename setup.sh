#!/bin/bash

# Remove any previously installed docker versions.
apt-get remove \
  -y \
  docker \
  docker-engine \
  docker.io \
  containerd \
  runc

# Update package index.
apt-get update

# Install dependencies for https repositories.
apt-get install \
  -y \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg-agent \
  software-properties-common

# Add dockers gpg key.
curl \
  -fsSL \
  https://download.docker.com/linux/ubuntu/gpg \
  | apt-key add -

# Set up dockers repository.
add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) \
  stable"

# Update package index.
apt-get update

# Install docker.
apt-get install \
  -y \
  docker-ce \
  docker-ce-cli \
  containerd.io

# Install docker-compose.
curl \
  -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" \
  -o /usr/local/bin/docker-compose

# Change permission to allow docker-compose to execute.
chmod +x /usr/local/bin/docker-compose