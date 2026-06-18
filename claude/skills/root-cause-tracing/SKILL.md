---
name: root-cause-tracing
description: "Find the cause behind a symptom. Use when a failure repeats, appears indirect, or has multiple possible causes."
---

# Root Cause Tracing

## Purpose
Find the cause behind a symptom.

## When to Use
Use when a failure repeats, appears indirect, or has multiple possible causes.

## Inputs
Reproduction steps, logs, changed files, dependency boundaries.

## Steps
1. Reproduce or isolate the symptom.
2. Trace backward to the first bad point.
3. Test one hypothesis at a time.
4. Confirm the fix addresses the cause.

## Gates
The explanation accounts for the observed symptom and the chosen fix.

## Evidence
Repro notes, hypothesis checks, and before/after behavior.

## Anti-Patterns
Treating downstream error messages as the root cause.

## Related
`failure-triage`, `systematic-debugging`
