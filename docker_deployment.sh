#!/bin/sh
# docker_deployment.sh - 
# 
# David.Dugard@fcc.gov - Thu Aug  3 14:06:17 EDT 2017
# 
############################################################
ENV_FILE=/home/ec2-user/env/webapp/.env
DOCKER_RUN="docker run -d -p 80:8080 --restart=always --log-opt max-size=100m --log-opt max-file=3 --privileged=true --privileged=true --env-file ${ENV_FILE} --name"
DOCKER_STOP="docker stop"

if [ $# -lt 2 ]; then
    echo "USAGE : $0 [NODE TO STOP] [NODE TO START]"

   exit;
 else

 NODE_TO_STOP=$1
 NODE_TO_START=$2

  
  if [ ! -f "$ENV_FILE" ]; then
    echo "$ENV_FILE not present - exiting"
    exit
    fi
$DOCKER_STOP $NODE_TO_STOP
$DOCKER_RUN $NODE_TO_START $NODE_TO_START

fi
############################################################
# EOF: docker_deployment.sh

