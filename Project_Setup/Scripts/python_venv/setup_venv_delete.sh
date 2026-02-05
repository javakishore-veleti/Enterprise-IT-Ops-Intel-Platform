#!/usr/bin/env bash
set -e

source "$(dirname "$0")/setup_env_vars.sh"

echo "[VENV] Deleting Python virtual environment"

if [[ ! -d "$VENV_DIR" ]]; then
  echo "[VENV] No virtualenv found at $VENV_DIR"
  exit 0
fi

rm -rf "$VENV_DIR"

echo "[VENV] Virtualenv deleted"
