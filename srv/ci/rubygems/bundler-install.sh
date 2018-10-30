#! /usr/bin/env bash

apt-get -y install bundler jq
bundle install

export PATH="~/bin:$PATH"

bundle show kitchen-inspec
bundle show kitchen-vagrant
bundle show kitchen-terraform
bundle show test-kitchen