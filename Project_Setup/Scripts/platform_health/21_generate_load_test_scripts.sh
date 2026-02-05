#!/usr/bin/env bash
set -e

echo "[21] Generating load test scripts"

BASE_DIR=$(git rev-parse --show-toplevel)
LT_DIR="$BASE_DIR/services/solutions/platform_health/load_test"

mkdir -p "$LT_DIR"

cat <<EOF > "$LT_DIR/locustfile.py"
from locust import HttpUser, task, between

class PlatformHealthUser(HttpUser):
    wait_time = between(1, 5)

    @task
    def analyze_health(self):
        self.client.post("/platform-health/analyze", json={
            "time_window": "5m",
            "service_scope": ["orders"],
            "metrics": {"cpu": 70},
            "error_rates": {"5xx": 0.01},
            "latency_p99": {"orders": 900}
        })
EOF

cat <<EOF > "$LT_DIR/README.md"
# Load Testing

Uses Locust to validate:
- throughput
- latency
- stability under load
EOF

echo "[21] Load test scripts generated"
