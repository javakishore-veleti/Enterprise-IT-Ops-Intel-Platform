#!/usr/bin/env bash
set -e

source "$(dirname "$0")/setup_env_vars.sh"

if [[ ! -d "$VENV_DIR" ]]; then
  echo "❌ Virtualenv does not exist. Run setup_venv_create first."
  exit 1
fi

# shellcheck source=/dev/null
source "$VENV_DIR/bin/activate"

REPO_ROOT=$(git rev-parse --show-toplevel)

pip install --upgrade pip
pip install -r "$REPO_ROOT/requirements.txt"

echo "[VENV] Requirements installed"
