#! /usr/bin/env bash

gem update --system
gem --version
gem install bundler
gem update bundler
bin/bundle install