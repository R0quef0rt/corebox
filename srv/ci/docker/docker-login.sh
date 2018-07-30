#!/bin/sh

echo $DOCKER_REG_APIKEY | docker login -u=$DOCKER_REG_USER --password-stdin https://$DOCKER_REG_HOST