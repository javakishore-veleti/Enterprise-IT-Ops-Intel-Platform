# Platform Health Intelligence – Threat Model

## Assets
- Platform health decisions
- Observability data
- Agent reasoning outputs
- LLM prompts and responses

## Trust Boundaries
- External invocation (API / events)
- Internal agent execution
- Context providers (MCP)
- Cloud service integrations

## Threat Analysis (STRIDE)

### Spoofing
- Mitigation: IAM-based authentication, no static keys

### Tampering
- Mitigation: Signed artifacts, immutable containers

### Repudiation
- Mitigation: CloudTrail, request tracing

### Information Disclosure
- Mitigation: KMS encryption, least-privilege IAM

### Denial of Service
- Mitigation: Rate limiting, circuit breakers

### Elevation of Privilege
- Mitigation: Scoped roles, IRSA, no wildcard permissions
