#!/bin/bash

# Update system
sudo yum update -y

# Install Git
sudo yum install -y git

# Install Java 11
sudo amazon-linux-extras enable corretto11
sudo yum install -y java-11-amazon-corretto

# Install Docker
sudo yum install -y docker
sudo systemctl enable --now docker
sudo usermod -aG docker ec2-user

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Verify installations
docker --version
docker-compose --version
java -version
git --version

