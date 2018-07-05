#!/bin/sh

if   [ "$SERVICE_NAME" != "buckets" ]; then
    terraform init \
    --reconfigure \
    -input=false \
    -upgrade \
    -backend-config=key=$ENV/$SERVICE_NAME/$PROJECT_KEY/terraform.tfstate \
    -backend-config=bucket=$TFSTATE_BUCKET \
    -backend-config=region=$REGION \
    # -backend-config=dynamodb_table=$ENV-tfstate-lock
elif [ "$SERVICE_NAME" = "buckets" ]; then
    terraform init \
    --reconfigure \
    -input=false \
    -upgrade \
    -backend-config=key=$ENV/$SERVICE_NAME/$PROJECT_KEY/terraform.tfstate \
    -backend-config=bucket=$TFSTATE_BUCKET \
    -backend-config=region=$REGION
else
    echo "DESTROY_ALL variable is $DESTROY_ALL. Skipping destruction."	
fi