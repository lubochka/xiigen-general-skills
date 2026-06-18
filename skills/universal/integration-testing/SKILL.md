# Integration Testing

## Purpose
Verify boundaries between components.

## When to Use
Use when behavior crosses services, modules, tools, adapters, or data formats.

## Inputs
Component boundary, contract, realistic inputs, target project commands.

## Steps
1. Identify the integration boundary.
2. Define realistic inputs and expected outputs.
3. Run or design the narrowest useful integration test.
4. Record unsupported dependencies or blockers.

## Gates
At least one meaningful boundary scenario is covered or blocked.

## Evidence
Integration test output, contract check, or explicit blocker.

## Anti-Patterns
Replacing integration coverage with isolated unit tests only.

## Related
`test-integrity`, `e2e-test-matrix`

