#!/bin/bash

source variables
PACKER_ENV=Ubuntu

if   [ "$DESTROY_ALL" == true ]; then
    echo "DESTROY_ALL is $DESTROY_ALL. Skipping..."
elif [ "$LATEST_AMI" == "$ENV-$SERVICE_NAME-$SERVICE_VERSION" ]; then
    echo "The latest AMI and this project are the same SERVICE_VERSION. Skipping..."
elif [ "$LATEST_AMI" = "null" ]; then
    packer build ./dev/$PACKER_ENV/packer.json
else
    echo "Something went wrong. This is probably a problem with the jq syntax in $0"
fi