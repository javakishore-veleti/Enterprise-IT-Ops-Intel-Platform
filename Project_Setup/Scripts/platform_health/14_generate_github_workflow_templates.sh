#!/usr/bin/env bash
set -e

echo "[14] Generating GitHub workflow templates"

BASE_DIR=$(git rev-parse --show-toplevel)
WF_DIR="$BASE_DIR/.github/workflows"

mkdir -p "$WF_DIR"

cat <<EOF > "$WF_DIR/build.yml"
name: Build Platform Health

on:
  workflow_dispatch:

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-python@v5
        with:
          python-version: '3.11'
      - run: pip install -r requirements.txt
      - run: pytest services/solutions/platform_health/tests
EOF

cat <<EOF > "$WF_DIR/deploy-dev.yml"
name: Deploy Platform Health - Dev

on:
  workflow_dispatch:

jobs:
  deploy:
    runs-on: ubuntu-latest
    environment: dev
    steps:
      - uses: actions/checkout@v4
      - run: echo "Deploying Platform Health to DEV"
EOF

cat <<EOF > "$WF_DIR/deploy-prod.yml"
name: Deploy Platform Health - Prod

on:
  workflow_dispatch:

jobs:
  deploy:
    runs-on: ubuntu-latest
    environment: prod
    steps:
      - uses: actions/checkout@v4
      - run: echo "Deploying Platform Health to PROD"
EOF

echo "[14] GitHub workflow templates generated"
