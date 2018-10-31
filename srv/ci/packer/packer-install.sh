#!/bin/sh

wget --quiet "https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip"
unzip packer_${PACKER_VERSION}_linux_amd64.zip -d /tmp
mkdir /usr/local/bin || true
mkdir ~/bin || true
cp /tmp/packer /usr/local/bin
cp /tmp/terraform ~/bin