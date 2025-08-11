#!/bin/bash
set -euo pipefail

NAMESPACE_FILE="ns.yml"
SECRET_FILE="sc.yml"
CONFIGMAP_FILE="cm.yml"
PVC_FILE="pvc.yml"
DEPLOYMENT_FILE="dp.yml"
SERVICE_FILE="srv.yml"

echo "Applying Kubernetes manifests in order:"

if [[ -f "$NAMESPACE_FILE" ]]; then
  echo "Applying namespace..."
  kubectl apply -f "$NAMESPACE_FILE"
fi

if [[ -f "$SECRET_FILE" ]]; then
  echo "Applying secrets..."
  kubectl apply -f "$SECRET_FILE"
fi

if [[ -f "$PVC_FILE" ]]; then
  echo "Applying PVC..."
  kubectl apply -f "$PVC_FILE"
fi

if [[ -f "$DEPLOYMENT_FILE" ]]; then
  echo "Applying deployments..."
  kubectl apply -f "$DEPLOYMENT_FILE"
fi

if [[ -f "$CONFIGMAP_FILE" ]]; then
  echo "Applying configmaps..."
  kubectl apply -f "$CONFIGMAP_FILE"
fi

if [[ -f "$SERVICE_FILE" ]]; then
  echo "Applying services..."
  kubectl apply -f "$SERVICE_FILE"
fi

echo "All manifests applied successfully!"