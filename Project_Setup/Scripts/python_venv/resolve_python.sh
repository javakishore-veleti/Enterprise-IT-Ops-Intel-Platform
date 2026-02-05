#!/usr/bin/env bash

resolve_python() {
  for version in "${SUPPORTED_PYTHON_VERSIONS[@]}"; do
    if command -v "python$version" >/dev/null 2>&1; then
      echo "python$version"
      return 0
    fi
  done

  echo ""
  return 1
}
