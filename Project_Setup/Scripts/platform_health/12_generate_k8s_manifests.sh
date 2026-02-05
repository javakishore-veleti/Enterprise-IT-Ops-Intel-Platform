#!/usr/bin/env bash
set -e

echo "[12] Generating Kubernetes manifests"

BASE_DIR=$(git rev-parse --show-toplevel)
K8S_DIR="$BASE_DIR/services/solutions/platform_health/k8s"

mkdir -p "$K8S_DIR"

cat <<EOF > "$K8S_DIR/deployment.yaml"
apiVersion: apps/v1
kind: Deployment
metadata:
  name: platform-health
spec:
  replicas: 2
  selector:
    matchLabels:
      app: platform-health
  template:
    metadata:
      labels:
        app: platform-health
    spec:
      containers:
      - name: platform-health
        image: platform-health:latest
        ports:
        - containerPort: 8000
        env:
        - name: AWS_REGION
          value: us-east-1
EOF

cat <<EOF > "$K8S_DIR/service.yaml"
apiVersion: v1
kind: Service
metadata:
  name: platform-health
spec:
  selector:
    app: platform-health
  ports:
  - port: 80
    targetPort: 8000
EOF

echo "[12] Kubernetes manifests generated"
