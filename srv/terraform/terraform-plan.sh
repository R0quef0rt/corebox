#!/bin/sh

terraform plan \
-var-file=./conf/$ENV.tfvars \
-var-file=./terraform.tfvars \
-input=false \
-out=plan.tfplan