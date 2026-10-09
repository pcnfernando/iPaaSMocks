# InsuranceService (WSO2 Cloud – Integration Platform / Devant)

Mock HealthGuard insurance REST APIs, copied from
`k8-artefacts-apim-bi-elk/use_cases/insurance/mock_insurance_backend`.
Deploy as **Integration as API**. Data is in-memory (resets on restart /
scale-to-zero). The MCP server is the separate `../insurancemcp` integration.

| Endpoint (`.choreo/component.yaml`) | Port | Base path | Spec |
|---|---|---|---|
| `insurance-customer-api` | 8082 | `/insurance/customer` | `openapi/customer-api.yaml` |
| `insurance-agent-api` | 8083 | `/insurance/agent` | `openapi/agent-api.yaml` |
