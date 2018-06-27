#!/bin/sh

export TF_WARN_OUTPUT_ERRORS=1

if   [ "$DESTROY_ALL" == true ] && [ "$SERVICE_NAME" != "buckets" ] || [ "$REBUILD" == true ] && [ "$SERVICE_NAME" != "buckets" ]; then
    terraform destroy \
    -force \
    -var-file=$CI_PROJECT_DIR/conf/$ENV.tfvars \
    -input=false
elif [ "$DESTROY_ALL" == true ] && [ "$SERVICE_NAME" = "buckets" ] || [ "$REBUILD" == true ] && [ "$SERVICE_NAME" = "buckets" ]; then
    terraform destroy \
    -force \
    -var-file=$CI_PROJECT_DIR/conf/$ENV.tfvars \
    -input=false \
    -lock=false
else
    echo "DESTROY_ALL variable is $DESTROY_ALL. Skipping destruction."	
fi