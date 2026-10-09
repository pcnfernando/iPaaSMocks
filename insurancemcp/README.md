# InsuranceMCP (WSO2 Cloud – Integration Platform / Devant)

The insurance MCP server (Streamable HTTP, `/mcp` on port 8084, 7 tools:
getPolicy, getClaims, submitClaim, listAllPolicies, updatePolicyStatus,
getAllClaims, updateClaim), split out of `../insuranceservice` so it can be
deployed with integration type **MCP Service** and listed under the
Developer Portal's *MCP Servers* section.

It has its own copy of `types.bal`/`data_mappings.bal`, so its in-memory data
is independent of `insuranceservice` (resets on restart / scale-to-zero).
No `.choreo/component.yaml` on purpose — let Devant derive the MCP endpoint.

Consumed by WSO2 Agent Manager as an MCP proxy upstream — runbook:
`k8-artefacts-apim-bi-elk/use_cases/insurance/amp_insurance_python_agent/README.md`.

Local run: `bal run`, then

```bash
curl -s -X POST localhost:8084/mcp -H 'content-type: application/json' \
  -H 'accept: application/json, text/event-stream' \
  -d '{"jsonrpc":"2.0","id":1,"method":"tools/list"}'
```
