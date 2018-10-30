#! /usr/bin/env bash

apt-get -y install bundler jq
bundle install

bundle show kitchen-inspec
bundle show kitchen-vagrant
bundle show kitchen-terraform
bundle show test-kitchen