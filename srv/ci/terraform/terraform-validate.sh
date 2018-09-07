#!/bin/sh

terraform validate \
-var-file=./env/$ENV/config.tfvars \
-check-variables=true