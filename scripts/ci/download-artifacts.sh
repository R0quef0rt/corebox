#!/bin/sh

apt install bc

ARTIFACTS_NUMBER= $(echo "$BUILD_NUMBER.$JOB_NUMBER-0.1" | bc)

echo "Downloading artifacts from previous stages..."

curl -o $CI_BUILD_DIR/variables https://$ARTIFACTS_PATH/$BUILD_NUMBER/$ARTIFACTS_NUMBER/variables || true
curl -o $CI_BUILD_DIR/plan.tfplan https://$ARTIFACTS_PATH/$BUILD_NUMBER/$ARTIFACTS_NUMBER/plan.tfplan || true