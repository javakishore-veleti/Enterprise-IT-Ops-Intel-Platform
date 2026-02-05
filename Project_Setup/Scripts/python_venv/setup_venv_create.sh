#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

source "$SCRIPT_DIR/setup_env_vars.sh"
source "$SCRIPT_DIR/resolve_python.sh"

echo "[VENV] Creating Python virtual environment"

mkdir -p "$VENV_BASE_DIR"

PYTHON_BIN=$(resolve_python)

if [[ -z "$PYTHON_BIN" ]]; then
  echo "❌ No supported Python version found."
  echo "Please install one of: ${SUPPORTED_PYTHON_VERSIONS[*]}"
  exit 1
fi

echo "[VENV] Using Python interpreter: $PYTHON_BIN"

if [[ -d "$VENV_DIR" ]]; then
  echo "[VENV] Virtualenv already exists at $VENV_DIR"
  exit 0
fi

"$PYTHON_BIN" -m venv "$VENV_DIR"

echo "[VENV] Virtualenv created at $VENV_DIR"
