#!/bin/bash
#
#           Run dockerfile in git repository koliacv/website 
#
#    This script will run only if docker and git installed on machine 
#
#
apt install wget -y
wget https://raw.githubusercontent.com/koliacv/website/master/.devops/docker-compose.yml
pwd
ls -lah
docker-compose up -d