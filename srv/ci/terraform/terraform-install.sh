#!/bin/sh

wget --quiet "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip"
unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /tmp
mkdir ~/bin || true
mv /tmp/terraform ~/bin

export PATH="~/bin/terraform:$PATH"