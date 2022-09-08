#!/bin/bash
#
#           Run dockerfile in git repository koliacv/website 
#
#    This script will run only if docker and git installed on machine 
#
#
echo "cd website/.devops/"
docker build . --file Dockerfile -t kolia2526/website
echo "docker builded"
docker run -d -p 80:80 kolia2526/website
echo "Docker run and work then" 
MYIP1=$(hostname -I | awk '{print $1}')
MYIP2=$(hostname -I | awk '{print $2}')
echo "go to ${MYIP1}:80 or ${MYIP2}:80"

echo "Test docker continer"
pwd=$(pwd)
ls -lah
docker ps -a|awk '{print $1}'|grep -v "CONTAINER"|grep -m1 "" > id.txt
cat $pwd/id.txt
docker exec -i $(cat $pwd/id.txt) ls -lah /usr/share/nginx/html

