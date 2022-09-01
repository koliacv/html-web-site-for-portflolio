#!/bin/bash
#
#           Run dockerfile in git repository koliacv/website 
#
#    This script will run only if docker and git installed on machine 
#
#
git clone https://github.com/koliacv/website.git
echo "cd website/"
cd website/
docker build -t website .
echo "docker builded"
docker run -d -p 80:80 website
echo "Docker run and work then"
MYIP=$(curl -s ipinfo.io/ip)
echo "go to ${MYIP}:80"