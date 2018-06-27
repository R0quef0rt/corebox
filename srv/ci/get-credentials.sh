#!/bin/sh

echo "Generate AWS local configuration files"

if [ -z "$REGION" ]; then
    echo "A required variable in $0 is unset."
else
    mkdir -p ~/.aws ~/.kube ~/.ssh
    echo -e '[default]' > ~/.aws/credentials
    echo -e '[default]' > ~/.aws/config
    echo 'region = '$REGION >> ~/.aws/config
fi


echo "Write AWS credentials to local file. Used to configure aws-cli."

if   [ "$ACCOUNT" = "dev" ];  then
    echo 'aws_access_key_id = '$DEV_AWS_ACCESS_KEY >> ~/.aws/credentials
    echo 'aws_secret_access_key = '$DEV_AWS_SECRET_KEY >> ~/.aws/credentials
elif [ "$ACCOUNT" = "root" ]; then
    echo 'aws_access_key_id = '$ROOT_AWS_ACCESS_KEY >> ~/.aws/credentials
    echo 'aws_secret_access_key = '$ROOT_AWS_SECRET_KEY >> ~/.aws/credentials
elif [ "$ACCOUNT" = "public" ]; then
    echo 'aws_access_key_id = '$PUBLIC_AWS_ACCESS_KEY >> ~/.aws/credentials
    echo 'aws_secret_access_key = '$PUBLIC_AWS_SECRET_KEY >> ~/.aws/credentials
elif [ "$ACCOUNT" = "iam" ]; then
    echo 'aws_access_key_id = '$IAM_AWS_ACCESS_KEY >> ~/.aws/credentials
    echo 'aws_secret_access_key = '$IAM_AWS_SECRET_KEY >> ~/.aws/credentials
elif [ "$ACCOUNT" = "vsoc" ]; then
    echo 'aws_access_key_id = '$VSOC_AWS_ACCESS_KEY >> ~/.aws/credentials
    echo 'aws_secret_access_key = '$VSOC_AWS_SECRET_KEY >> ~/.aws/credentials
elif [ "$ACCOUNT" = "qa" ]; then
    echo 'aws_access_key_id = '$QA_AWS_ACCESS_KEY >> ~/.aws/credentials
    echo 'aws_secret_access_key = '$QA_AWS_SECRET_KEY >> ~/.aws/credentials
elif [ "$ACCOUNT" = "shared" ]; then
    echo 'aws_access_key_id = '$SHARED_AWS_ACCESS_KEY >> ~/.aws/credentials
    echo 'aws_secret_access_key = '$SHARED_AWS_SECRET_KEY >> ~/.aws/credentials
else
    echo "A required secret variable is either incorrect or not defined. Please check Gitlab CI's secret variables."
fi


echo "Write SSH private key to local file. Determines the key used to manage instances."

if   [ "$ENV" = "dev" ];  then
    echo "$DEV_SSH_PRIVATE_KEY" > ~/.ssh/id_rsa
    echo "$DEV_SSH_PUBLIC_KEY" > ~/.ssh/id_rsa.pub
elif [ "$ENV" = "qa" ]; then
    echo "$QA_SSH_PRIVATE_KEY" > ~/.ssh/id_rsa
    echo "$QA_SSH_PUBLIC_KEY" > ~/.ssh/id_rsa.pub
elif [ "$ENV" = "prod" ]; then
    echo "$PROD_SSH_PRIVATE_KEY" > ~/.ssh/id_rsa
    echo "$PROD_SSH_PUBLIC_KEY" > ~/.ssh/id_rsa.pub
else
    echo "A required secret variable is either incorrect or not defined. Please check Gitlab CI's secret variables."
fi