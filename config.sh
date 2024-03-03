#!/usr/bin/env bash
namespace="homepage"

if ! kubectl get namespace $namespace
then
    kubectl create namespace $namespace
    kubectl patch namespace $namespace -p "{\"metadata\": {\"labels\": {\"name\": \"${namespace}\"}}}"
fi

kubectl --namespace $namespace apply -f ./persist/certificate.yaml
kubectl --namespace $namespace apply -f ./persist/volume.yaml
kubectl --namespace $namespace apply -f configmap.yaml
kubectl --namespace $namespace apply -f rbac.yaml
kubectl --namespace $namespace apply -f deployment.yaml
kubectl --namespace $namespace apply -f service.yaml
kubectl --namespace $namespace apply -f ingress.yaml
