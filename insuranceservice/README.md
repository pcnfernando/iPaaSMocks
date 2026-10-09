# InsuranceService (WSO2 Cloud – Integration Platform / Devant)

Mock HealthGuard insurance backend + MCP server, copied from
`k8-artefacts-apim-bi-elk/use_cases/insurance/mock_insurance_backend` for
hosting on Devant. Data is in-memory (resets on restart / scale-to-zero).

| Endpoint (`.choreo/component.yaml`) | Port | Base path | Spec |
|---|---|---|---|
| `insurance-customer-api` | 8082 | `/insurance/customer` | `openapi/customer-api.yaml` |
| `insurance-agent-api` | 8083 | `/insurance/agent` | `openapi/agent-api.yaml` |
| `insurance-mcp` | 8084 | `/mcp` | wildcard (MCP Streamable HTTP, 7 tools) |

Secure `insurance-mcp` with **API Key** (header `api-key`) and register its
Production URL as an MCP server in WSO2 Agent Manager. Full runbook:
`k8-artefacts-apim-bi-elk/use_cases/insurance/amp_insurance_python_agent/README.md`.

Local run: `bal run`, then

```bash
curl -s -X POST localhost:8084/mcp -H 'content-type: application/json' \
  -H 'accept: application/json, text/event-stream' \
  -d '{"jsonrpc":"2.0","id":1,"method":"tools/list"}'
```
