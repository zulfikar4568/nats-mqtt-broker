#!/bin/bash

source ./scripts/functions.sh

printf "${BLUE}"
echo "---------------------------------"
echo "--      Start All Container     --"
echo "---------------------------------"
printf "${NC}\n"

# Stop all task if docker daemon is not active
check_docker_active

printf "${PURPLE}"
echo "Starting docker engine..."
printf "${NC}"

docker-compose up -d --build

echo ""
printf "${GREEN}"
echo "------ Machine is on running now. -------"
printf "${NC}"