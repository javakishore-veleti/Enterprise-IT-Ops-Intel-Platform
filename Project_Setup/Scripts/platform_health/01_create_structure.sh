#!/usr/bin/env bash
set -e

echo "[01] Creating platform_health directory structure"

BASE_DIR=$(git rev-parse --show-toplevel)

mkdir -p \
  "$BASE_DIR/services/solutions/platform_health/dto" \
  "$BASE_DIR/services/solutions/platform_health/domain" \
  "$BASE_DIR/services/solutions/platform_health/ports" \
  "$BASE_DIR/services/solutions/platform_health/adapters" \
  "$BASE_DIR/services/solutions/platform_health/orchestration"

echo "[01] platform_health structure ensured (idempotent)"
