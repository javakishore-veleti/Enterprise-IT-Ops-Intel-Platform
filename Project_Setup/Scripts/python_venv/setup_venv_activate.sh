#!/usr/bin/env bash

source "$(dirname "$0")/setup_env_vars.sh"

if [[ ! -d "$VENV_DIR" ]]; then
  echo "❌ Virtualenv does not exist. Run setup_venv_create first."
  return 1
fi

# shellcheck source=/dev/null
source "$VENV_DIR/bin/activate"

echo "[VENV] Activated: $VENV_NAME"
