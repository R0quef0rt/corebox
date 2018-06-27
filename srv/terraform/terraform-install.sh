#!/bin/sh

TERRAFORM_VERSION=0.11.7

wget --quiet https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip
mv terraform /usr/local/bin

export PATH="~/usr/local/bin:$PATH"