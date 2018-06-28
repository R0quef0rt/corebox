#!/bin/bash

mkdir -p /app
mkdir -p /srv/salt/states

# wget -O bootstrap-salt.sh https://bootstrap.saltstack.com
# sh bootstrap-salt.sh -P -U -F \
#   -i devbox \
#   -c /tmp \
#   git v${SALT_VERSION}