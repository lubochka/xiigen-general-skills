---
name: code-execution
description: "Run commands safely and intentionally. Use before executing build, test, lint, generation, migration, deploy, or cleanup commands."
---

# Code Execution

## Purpose
Run commands safely and intentionally.

## When to Use
Use before executing build, test, lint, generation, migration, deploy, or cleanup commands.

## Inputs
Commands from target project profile, safe command list, approval-required commands, forbidden patterns.

## Steps
1. Prefer documented target-project commands.
2. Check whether the command is safe, approval-required, or forbidden.
3. Run the narrowest relevant command.
4. Preserve useful output for evidence.

## Gates
The command is relevant, scoped, and allowed.

## Evidence
Command output, exit code, and reason for skipped commands.

## Anti-Patterns
Running broad build/test/deploy by habit or copying commands from another project.

## Related
`code-request-safety`, `test-integrity`
