#!/bin/sh

if [ "$DESTROY_ALL" == true ]; then
    echo "DESTROY_ALL variable is set to $DESTROY_ALL. Skipping targetted apply..."	
else
    echo "DESTROY_ALL variable is set to $DESTROY_ALL. Creating targetted resources..."	
  for var in "$@"
  do
    export RESOURCE="$var"
    terraform refresh -target=data.terraform_remote_state.environment
    sleep 10
    terraform plan \
    -var-file=$CI_PROJECT_DIR/env/$ENV/config.tfvars \
    -var-file=$CI_PROJECT_DIR/terraform.tfvars \
    -input=false \
    -out=plan.tfplan \
    -target=$RESOURCE

    terraform apply \
    -input=false plan.tfplan
  done
fi