#!/bin/sh

wget --quiet "https://releases.hashicorp.com/vagrant/${VAGRANT_VERSION}/vagrant_${VAGRANT_VERSION}_linux_amd64.zip"
unzip vagrant_${VAGRANT_VERSION}_linux_amd64.zip -d /tmp
mkdir ~/bin || true
mv /tmp/vagrant ~/bin