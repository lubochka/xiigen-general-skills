# Before And After: Prompt-Only vs Skill-Based AI Coding

These examples show the positioning for organic discovery and documentation.
They are sanitized examples, not private project transcripts.

## Before: Prompt-Only

```text
Fix the tests and tell me when it is done.
```

Risk:

- the agent may edit before reading project rules;
- tests may be weakened instead of fixed;
- completion may be claimed without evidence;
- logs may be copied into public output.

## After: Skill-Based

```text
Use project-rules-first, test-integrity, failure-triage and
evidence-before-final. Fix the failing tests only after identifying the cause.
Report commands run, changed files and unchecked risks.
```

Expected behavior:

- read target rules first;
- classify the failure;
- preserve test meaning;
- run target project verification;
- report evidence and remaining risk plainly.

## Starter Skill Set

- `project-rules-first`
- `failure-triage`
- `test-integrity`
- `code-execution`
- `evidence-before-final`
- `session-output-contract`
