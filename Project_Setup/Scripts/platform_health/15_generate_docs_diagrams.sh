#!/usr/bin/env bash
set -e

echo "[15] Generating architecture diagrams"

BASE_DIR=$(git rev-parse --show-toplevel)
DOC_DIR="$BASE_DIR/docs/architecture/platform_health"

mkdir -p "$DOC_DIR"

cat <<EOF > "$DOC_DIR/platform_health_architecture.puml"
@startuml
actor User
component "API / Workflow" as API
component "PlatformHealthFacade" as Facade
component "Observability Agent" as Obs
component "Decision Agent" as Dec
database "Observability Systems" as ObsSys

User --> API
API --> Facade
Facade --> Obs
Obs --> ObsSys
Obs --> Dec
Dec --> Facade
Facade --> API
@enduml
EOF

cat <<EOF > "$DOC_DIR/platform_health_flow.mmd"
flowchart LR
    A[Invocation] --> B[PlatformHealthFacade]
    B --> C[Observability Agent]
    C --> D[Metrics / Logs / Traces]
    C --> E[Decision Agent]
    E --> F[Health Decision]
EOF

echo "[15] PlantUML and Mermaid diagrams generated"
