#!/usr/bin/env bash
namespace="homepage"


kubectl --namespace $namespace delete -f configmap.yaml
kubectl --namespace $namespace apply -f configmap.yaml

kubectl --namespace $namespace delete pod $(kubectl --namespace $namespace get pod -o json | jq '.items[0].metadata.name' | sed 's/"//g')
