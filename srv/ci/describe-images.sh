#!/bin/bash

echo "Looking up the latest AMI for $SERVICE_NAME..."
echo $(aws ec2 describe-images --owners self --filters "Name=name,Values=$ENV-$SERVICE_NAME-$SERVICE_VERSION*") > images.json