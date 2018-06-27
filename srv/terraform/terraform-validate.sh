#!/bin/sh

terraform validate \
-var-file=./conf/$ENV.tfvars \
-check-variables=true