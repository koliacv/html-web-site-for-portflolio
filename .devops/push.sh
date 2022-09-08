#!/bin/bash
#
#           Run dockerfile in git repository koliacv/website 
#
#    This script will run only if docker and git installed on machine 
#
#

echo "---------------------docker-compose run---------------------"
docker-compose up -d
echo "Docker run and work then"
MYIP1=$(hostname -I | awk '{print $1}')
MYIP2=$(hostname -I | awk '{print $2}')
echo "go to ${MYIP1}:80 or ${MYIP2}:80"