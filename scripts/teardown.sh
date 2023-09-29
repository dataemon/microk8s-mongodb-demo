#!/bin/sh
##
# Script to remove/undepoy all project resources from the local Minikube environment.
##

# Delete mongod stateful set + mongodb service + secrets + host vm configuer daemonset
microk8s kubectl delete statefulsets mongod
microk8s kubectl delete services mongodb-service
microk8s kubectl delete secret shared-bootstrap-data
sleep 3

# Delete persistent volume claims
microk8s kubectl delete persistentvolumeclaims -l role=mongo

