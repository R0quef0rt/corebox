#!/bin/sh

if   [ "$SERVICE_NAME" != "buckets" ]; then
    terraform init \
    --reconfigure \
    -input=false \
    -upgrade \
    -backend-config=key=$PROVIDER/$CI_PROJECT_PATH/$PROJECT_KEY/terraform.tfstate \
    -backend-config=bucket=cdi-tfstate-$ACCOUNT-$ENV-$REGION \
    -backend-config=region=$REGION \
    -backend-config=dynamodb_table=$ENV-tfstate-lock
elif [ "$SERVICE_NAME" = "buckets" ]; then
    terraform init \
    --reconfigure \
    -input=false \
    -upgrade \
    -backend-config=key=$PROVIDER/$CI_PROJECT_PATH/$PROJECT_KEY/terraform.tfstate \
    -backend-config=bucket=cdi-tfstate-$ACCOUNT-$ENV-$SERVICE_NAME \
    -backend-config=region=$REGION
else
    echo "DESTROY_ALL variable is $DESTROY_ALL. Skipping destruction."	
fi