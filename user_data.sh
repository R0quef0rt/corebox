#!/bin/bash

mkdir -p /app/salt /app/pillar /etc/salt
chmod -r 777 /app/salt
chmod -r 777 /app/pillar
chmod -r 777 /etc/salt

wget -O bootstrap-salt.sh https://bootstrap.saltstack.com
sh bootstrap-salt.sh -P -U -F \
  -c /tmp \
  -p gitpython \
  git v3000.2

touch /tmp/signal