#!/bin/sh

echo "Generate AWS local configuration files"

if [ -z "$REGION" ]; then
    echo "A required variable in $0 is unset."
else
    mkdir -p ~/.aws ~/.ssh
    echo -e '[default]' > ~/.aws/credentials
    echo -e '[default]' > ~/.aws/config
    echo 'region = '$REGION >> ~/.aws/config
fi


echo "Write AWS credentials to local file. Used to configure aws-cli."

if   [ "$ACCOUNT" = "root" ]; then
    echo 'aws_access_key_id = '$ARTIFACTS_KEY >> ~/.aws/credentials
    echo 'aws_secret_access_key = '$ARTIFACTS_SECRET >> ~/.aws/credentials
else
    echo "A required secret variable is either incorrect or not defined. Please check Gitlab CI's secret variables."
fi