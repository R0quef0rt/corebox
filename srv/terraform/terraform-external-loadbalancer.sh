#!/bin/bash

echo "{\"elb_dns\":\"$(source variables && kubectl describe svc "${SERVICE_NAME}" --namespace kube-system | grep Ingress | awk '{print $3}')\"}"