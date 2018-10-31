#!/bin/sh

terraform plan \
-var-file=./env/$ENV/config.tfvars \
-input=false \
-out=plan.tfplan