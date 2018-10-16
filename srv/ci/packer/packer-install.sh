#!/bin/sh

wget --quiet "https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip"
unzip packer_${PACKER_VERSION}_linux_amd64.zip -d /tmp
mkdir ~/bin || true
mv /tmp/packer ~/bin