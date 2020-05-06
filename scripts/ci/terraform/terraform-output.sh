#!/bin/sh

if   [ "$DESTROY_ALL" == true ]; then
    echo "DESTROY_ALL variable is set to $DESTROY_ALL. Skipping cluster name export..."	
else
    echo "DESTROY_ALL variable is set to $DESTROY_ALL. Exporting $CLUSTER_NAME to file..."	
    echo CLUSTER_NAME=$(terraform output cluster_name) >> variables
fi