# Using XIIGen Skills With Codex

This directory provides Codex-compatible skill folders generated from the
canonical universal skills.

## Install From A Clone

Copy:

```text
codex/skills/
```

into the target project:

```text
.agents/skills/
```

Then ask Codex to use the relevant skill for planning, review, debugging,
execution gates or final evidence checks.

## Recommended Starter Set

- `project-rules-first`
- `code-examination`
- `code-request-safety`
- `code-execution`
- `test-integrity`
- `generated-code-review`
- `evidence-before-final`
- `goal-delivery-completeness`

## Safety

Codex should inspect local project rules before acting. It should not treat
generated reports, screenshots or successful commands as approval by itself.
