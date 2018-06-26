#!/bin/bash

SALT_VERSION=2018.3.1

apt-get update && apt-get install wget git python-dev python-pip python-git -y

mkdir -p /app

mkdir -p /etc/salt/minion.d
echo "${MINION_TEMPLATE}" > /etc/salt/minion.d/custom.conf

wget -O bootstrap-salt.sh https://bootstrap.saltstack.com
sh bootstrap-salt.sh -P -U -F \
  -i devbox \
  -c /tmp \
  git v${SALT_VERSION}