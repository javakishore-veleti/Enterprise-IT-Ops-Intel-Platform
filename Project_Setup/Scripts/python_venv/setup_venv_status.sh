#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

source "$SCRIPT_DIR/setup_env_vars.sh"
source "$SCRIPT_DIR/resolve_python.sh"

echo "------------------------------------"
echo "Python Venv Status"
echo "------------------------------------"
echo "VENV_DIR: $VENV_DIR"

PYTHON_BIN=$(resolve_python)
if [[ -n "$PYTHON_BIN" ]]; then
  echo "Resolved Python: $PYTHON_BIN"
else
  echo "Resolved Python: NONE (unsupported)"
fi

if [[ -d "$VENV_DIR" ]]; then
  echo "Venv Exists: YES"
else
  echo "Venv Exists: NO"
fi

if [[ -n "$VIRTUAL_ENV" ]]; then
  echo "Active: YES ($VIRTUAL_ENV)"
else
  echo "Active: NO"
fi
