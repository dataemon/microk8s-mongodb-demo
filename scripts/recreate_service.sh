#!/bin/sh
##
# Script to just deploy the MongoDB Service & StatefulSet back onto the exising Kubernetes cluster.
##

# Show persistent volume claims are still reserved even though mongod stateful-set not deployed
microk8s kubectl get persistentvolumes

# Deploy just the mongodb service with mongod stateful-set only
microk8s kubectl apply -f ../resources/mongodb-service.yaml
sleep 5

# Print current deployment state (unlikely to be finished yet)
microk8s kubectl get all 
microk8s kubectl get persistentvolumes
echo
echo "Keep running the following command until all 'mongod-n' pods are shown as running:  kubectl get all"
echo

