#!/bin/bash

echo ""
echo "****************************************************"
echo "Welcome to Nervelife install script for Soma Project"
echo "****************************************************"
echo ""
echo "Initializing... gcloud auth login"

gcloud init

echo ""
echo "pulling the latest code from the repository..."
echo ""

# change the directory to the project directory /home
mkdir -p /home/soma

cd /home/soma

# clone the repository
gcloud source repos clone NerveLife-Home
gcloud source repos clone nervelife-www
gcloud source repos clone ng-soma
gcloud source repos clone soma-docker

echo ""
echo "Finished installing the source code..."
echo ""

mkdir -p /home/builder

cp -r /home/soma/soma-docker /home/builder/