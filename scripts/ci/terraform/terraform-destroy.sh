#!/bin/sh

export TF_WARN_OUTPUT_ERRORS=1

if   [ "$DESTROY_ALL" == true ] || [ "$REBUILD" == true ]; then
    terraform destroy \
    -force \
    -var-file=$CI_BUILD_DIR/env/$ENV/config.tfvars \
    -input=false
elif [ "$DESTROY_ALL" == true ] || [ "$REBUILD" == true ]; then
    terraform destroy \
    -force \
    -var-file=$CI_BUILD_DIR/env/$ENV/config.tfvars \
    -input=false \
    -lock=false
else
    echo "DESTROY_ALL variable is $DESTROY_ALL. Skipping destruction."	
fi