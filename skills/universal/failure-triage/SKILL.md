# Failure Triage

## Purpose
Classify failures before changing implementation.

## When to Use
Use after failed builds, tests, commands, or smoke checks.

## Inputs
Failure output, environment, recent changes, expected behavior.

## Steps
1. Capture the symptom.
2. Classify likely source: code, test, environment, data, flaky behavior, or command misuse.
3. Choose the smallest next check.
4. Avoid broad rewrites until cause is narrowed.

## Gates
There is a probable cause and next diagnostic step.

## Evidence
Failure logs, narrowed hypothesis, and targeted check result.

## Anti-Patterns
Fixing blindly; changing multiple variables at once.

## Related
`root-cause-tracing`, `systematic-debugging`

