#!/bin/sh

terraform plan \
-var-file=$CI_PROJECT_DIR/conf/$ENV.tfvars \
-var-file=$CI_PROJECT_DIR/terraform.tfvars \
-input=false \
-out=plan.tfplan