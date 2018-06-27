#!/bin/sh

TERRAFORM_VERSION=0.11.7

wget -sLo /tmp/terraform.zip https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
unzip /tmp/terraform.zip -d /tmp
mkdir ~/bin
mv /tmp/terraform ~/bin

export PATH="~/bin:$PATH"