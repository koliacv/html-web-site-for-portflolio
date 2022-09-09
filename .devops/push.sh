#!/bin/bash
#
#           Run dockerfile in git repository koliacv/website 
#
#    This script will run only if docker and git installed on machine 
#
#
echo "---------------Start deploy to server---------------"
pwd
docker kill $(docker ps -q)
rm -r /home/kolia/devops*
git clone https://github.com/koliacv/website.git -b master
cd /home/kolia/devops/website/.devops
docker-compose up -d 
