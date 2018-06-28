#!/bin/sh

echo "Downloading artifacts from previous stages..."

curl -o $TRAVIS_BUILD_DIR/plan.tfplan https://s3.amazonaws.com/roquefort-tfstate/R0quef0rt/devbox/32/32.1/plan.tfplan