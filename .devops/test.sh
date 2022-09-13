#!/bin/bash
#
#           Run dockerfile in git repository koliacv/website 
#
#    This script will run only if docker and git installed on machine 
#
#
#ENV
REPO_NAME=kolia2526/website
pwd=$(pwd)
date=latest
###
echo "---------------------------------Start docker build------------------------------"
docker kill $(docker ps -q)
docker rm $(docker ps -a -f status=exited -q)
docker build . --file Dockerfile -t $REPO_NAME:$date
echo "docker builded--------------------------"
echo "--------------------------------DOCKER RUN-------------------------------"

docker run -d -p 80:80 $REPO_NAME:$date
echo "Docker run and work then" 
MYIP1=$(hostname -I | awk '{print $1}')
MYIP2=$(hostname -I | awk '{print $2}')
echo "--------------------go to ${MYIP1}:80 or ${MYIP2}:80---------------------------"

echo "---------------------------Test docker continer--------------------------------"

ls -lah
echo "--------workdir------"
docker ps -a|awk '{print $1}'|grep -v "CONTAINER"|grep -m1 "" > id.txt
cat $pwd/id.txt

echo "---------docker continer-------"

docker exec -i $(cat $pwd/id.txt) ls /usr/share/nginx/html



echo "---------------------------PUSH TO DOCKERHUB-----------------------------------"

docker push $REPO_NAME:$date