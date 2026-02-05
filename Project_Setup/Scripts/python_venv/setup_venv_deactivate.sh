#!/usr/bin/env bash

if [[ -z "$VIRTUAL_ENV" ]]; then
  echo "[VENV] No active virtualenv"
  return 0
fi

deactivate

echo "[VENV] Deactivated"
