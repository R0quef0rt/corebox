#!/bin/sh

if [ "$DESTROY_ALL" == true ]
then
    echo "DESTROY_ALL variable is $DESTROY_ALL. Skipping Terraform apply..."	
else
    terraform apply \
    -input=false plan.tfplan
fi