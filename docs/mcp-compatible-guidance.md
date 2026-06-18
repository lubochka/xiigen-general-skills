# MCP-Compatible Guidance

This repository is a skills and guidance pack. It is not an MCP server.

The skills can still help MCP-based workflows by defining safe behavior around:

- tool selection;
- command execution;
- evidence collection;
- no-secret boundaries;
- review gates;
- final answer claims.

## Recommended Positioning

Use:

```text
MCP-compatible guidance skills for AI coding agents
```

Avoid claiming this repository exposes MCP tools or runs an MCP server unless a
real server implementation is added later.

## Integration Pattern

1. Install the relevant skills or rules into the target project.
2. Configure MCP tools separately in the target agent.
3. Use `code-request-safety`, `code-execution`, `no-secrets` and
   `evidence-before-final` before running tools that touch files, commands or
   external systems.
