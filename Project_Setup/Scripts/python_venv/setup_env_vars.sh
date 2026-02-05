#!/usr/bin/env bash

# Supported Python major.minor versions (highest priority first)
export SUPPORTED_PYTHON_VERSIONS=("3.13" "3.12" "3.11")

# Virtualenv configuration
export VENV_BASE_DIR="$HOME/runtime_data/python_venvs"
export VENV_NAME="enterprise_it_ops"
export VENV_DIR="$VENV_BASE_DIR/$VENV_NAME"
