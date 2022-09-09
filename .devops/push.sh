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
docker-compose up -d 
