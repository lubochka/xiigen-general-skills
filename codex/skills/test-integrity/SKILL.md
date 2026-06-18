---
name: test-integrity
description: "Keep tests meaningful and honest. Use when writing, changing, disabling, or interpreting tests."
---

# Test Integrity

## Purpose
Keep tests meaningful and honest.

## When to Use
Use when writing, changing, disabling, or interpreting tests.

## Inputs
Test intent, assertions, fixtures, failures, target behavior.

## Steps
1. Confirm what behavior the test protects.
2. Avoid weakening assertions to pass.
3. Run targeted checks from the target project profile.
4. Explain skipped tests and risks.

## Gates
Tests validate behavior rather than hide failures.

## Evidence
Relevant test output, assertion changes, and failure explanation.

## Anti-Patterns
Deleting or weakening failing tests for a green result.

## Related
`integration-testing`, `e2e-test-matrix`
