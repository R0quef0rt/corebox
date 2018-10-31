#!/bin/sh

terraform init \
  --reconfigure \
  -input=false \
  -upgrade \
  -backend-config=key=$ENV/$SERVICE_NAME/$PROJECT_KEY/terraform.tfstate \
  -backend-config=bucket=$TFSTATE_BUCKET \
  -backend-config=region=$REGION \
  -backend-config=encrypt=true
# -backend-config=dynamodb_table=$ENV-tfstate-lock