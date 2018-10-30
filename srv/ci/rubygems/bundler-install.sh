#! /usr/bin/env bash

apt-get -y install bundler jq
bundle install --system

# bundle show kitchen-inspec
# bundle show kitchen-vagrant
# bundle show kitchen-terraform
# bundle show test-kitchen

# $ rm .bundle/config # remove a broken bundler configuration
# $ gem update --system # might help if rubygems is outdated / broken
# $ gem update bundler # might help if bundler is outdated / broken
# $ bundle install # dependency hell