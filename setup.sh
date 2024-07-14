#!/bin/bash

# Run Docker container for installing SOMA projects

# Check if Docker is installed
docker --version
if [ $? -eq 0 ]; then
    echo "Docker is already installed"
else
    echo "Docker is not installed"
    echo "Please install Docker before running this script!"
    exit 1
fi

# Check if Docker is running
docker ps -a
if [ $? -eq 0 ]; then
    echo "Docker is running"
else
    echo "Docker is not running"
    echo "Please start Docker before running this script!"
    exit 1
fi

echo "Creating Docker SOMA Volumes"

# Creadte Volumes for Docker container
docker volume create soma-dev_gcloud-config
docker volume create soma-dev_soma-source
docker volume create vscode-java-extension
docker volume create vscode-java-extension-cache
docker volume create vscode-node-extension
docker volume create vscode-node-extension-cache

echo "Buliding Docker Images"
echo "Please wait..."

# Run Docker Install Container
docker run -it --rm \
-v soma-dev_gcloud-config:/root/.config \
-v soma-dev_soma-source:/home/soma \
-v "$(pwd)":/home/builder \
gcr.io/google.com/cloudsdktool/google-cloud-cli:alpine \
bash -c "cd /home/builder && chmod +x ./install.sh && ./install.sh"

echo "Finished installing the source code..."

echo "Building Docker Compose development"
echo "Please wait..."

cd soma-docker/docker-compose/

docker compose up





