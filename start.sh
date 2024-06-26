#!/bin/bash
# Keep install script for docker compose

echo "Creating state directory."
mkdir -p state
test -e state
echo "Changing directory ownership to non-privileged user."
chown -R 999:999 state || echo "Unable to change directory ownership, changing permissions instead." && chmod -R 0777 state
which curl &> /dev/null || echo "curl not installed" 
curl https://github.com/AviNikhil/keep12/blob/main/docker-compose.yml --output docker-compose.yml
curl https://github.com/AviNikhil/keep12/blob/main/docker-compose.common.yml  --output docker-compose.common.yml

docker compose up -d
