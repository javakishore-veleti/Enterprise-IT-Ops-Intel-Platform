#!/usr/bin/env bash
set -e

echo "=============================================="
echo " Platform Health Solution – Full Setup Runner "
echo "=============================================="

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "[RUNNER] Using script directory: $SCRIPT_DIR"
echo

run_step() {
  local step="$1"
  echo "----------------------------------------------"
  echo "[RUNNER] Executing $step"
  echo "----------------------------------------------"
  bash "$SCRIPT_DIR/$step"
  echo "[RUNNER] Completed $step"
  echo
}

run_step "01_create_structure.sh"
run_step "02_generate_dtos.sh"
run_step "03_generate_ports.sh"
run_step "04_generate_adapters.sh"
run_step "05_generate_facade.sh"
run_step "06_generate_langgraph_adapter.sh"
run_step "07_generate_fastapi_adapter.sh"
run_step "08_generate_step_functions_definition.sh"
run_step "09_generate_unit_tests.sh"
run_step "10_generate_dockerfile.sh"
run_step "11_generate_local_run.sh"
run_step "12_generate_k8s_manifests.sh"
run_step "13_generate_lambda_handler.sh"
run_step "14_generate_github_workflow_templates.sh"

echo "=============================================="
echo " Platform Health Solution setup COMPLETE "
echo "=============================================="
