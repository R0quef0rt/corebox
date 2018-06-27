#!/bin/sh

terraform validate \
-var-file=$CI_PROJECT_DIR/conf/$ENV.tfvars \
-check-variables=true