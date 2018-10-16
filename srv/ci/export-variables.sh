#!/bin/bash

echo "Export required variables from .gitlab-ci.yml to terraform.tfvars"

if [ -z "$ENV" ] && [ -z "$PROVIDER" ] && [ -z "$REGION" ] && [ -z "$SERVICE_NAME" ] && [ -z "$ACCOUNT" ]; then
    echo "A required variable in $0 is unset."
else
    echo "env = \"$ENV\"" > terraform.tfvars
    echo "provider = \"$PROVIDER\"" >> terraform.tfvars
    echo "region = \"$REGION\"" >> terraform.tfvars
    echo "service_name = \"$SERVICE_NAME\"" >> terraform.tfvars
    echo "project_key = \"$PROJECT_KEY\"" >> terraform.tfvars
    echo "service_version = \"$SERVICE_VERSION\"" >> terraform.tfvars
    echo "account = \"$ACCOUNT\"" >> terraform.tfvars
    echo "os_family = \"$OS_FAMILY\"" >> terraform.tfvars
fi


echo "Export variables to 'variables' file"

export LATEST_AMI=$(cat images.json | jq '.Images[0] .Name')

if [ "$LATEST_AMI" = "null" ] || [ "$LATEST_AMI" = "" ]; then
    echo "AMI is missing or null."
    echo "LATEST_AMI=\"null\"" >> variables
else
    echo "LATEST_AMI=\"$LATEST_AMI\"" >> variables
fi


echo "Export secret variables for $ENV to terraform.tfvars"

if   [ "$ENV" = "dev" ];  then
    echo "ssh_public_key = \"$DEV_SSH_PUBLIC_KEY\"" >> terraform.tfvars
elif [ "$ENV" = "qa" ]; then
    echo "ssh_public_key = \"$QA_SSH_PUBLIC_KEY\"" >> terraform.tfvars
elif [ "$ENV" = "prod" ]; then
    echo "ssh_public_key = \"$PROD_SSH_PUBLIC_KEY\"" >> terraform.tfvars
else
    echo "The ENV variable is unset, not defined in $0, or is missing a configuration file in terraform.tfvars."
fi