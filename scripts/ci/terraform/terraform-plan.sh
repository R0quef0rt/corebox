#!/bin/sh

terraform plan \
-var-file=./env/$ENV/config.tfvars \
-var-file=./terraform.tfvars \
-input=false \
-out=plan.tfplan