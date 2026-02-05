#!/usr/bin/env bash
set -e

echo "[10] Generating Dockerfile"

BASE_DIR=$(git rev-parse --show-toplevel)
PH_DIR="$BASE_DIR/services/solutions/platform_health"

cat <<EOF > "$PH_DIR/Dockerfile"
FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

COPY services /app/services

ENV PYTHONPATH=/app

CMD ["python", "-c", "print('Platform Health service container ready')"]
EOF

echo "[10] Dockerfile generated"
