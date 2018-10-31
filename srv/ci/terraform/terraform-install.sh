#!/bin/sh

wget --quiet "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip"
unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /tmp
mkdir /usr/local/bin || true
mkdir ~/bin || true
cp /tmp/terraform /usr/local/bin
cp /tmp/terraform ~/bin