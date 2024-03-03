#!/usr/bin/env bash
namespace="homepage"

kubectl --namespace $namespace delete -f configmap.yaml
kubectl --namespace $namespace delete -f serviceaccount.yaml
kubectl --namespace $namespace delete -f secret.yaml
kubectl --namespace $namespace delete -f role.yaml
kubectl --namespace $namespace delete -f deployment.yaml
kubectl --namespace $namespace delete -f service.yaml
kubectl --namespace $namespace delete -f ingress.yaml

