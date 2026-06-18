# Using XIIGen Skills With Claude

This directory provides Claude-compatible skill folders generated from the
canonical universal skills.

## Install From A Clone

Copy:

```text
claude/skills/
```

into the target project:

```text
.claude/skills/
```

Then ask Claude to read the relevant `SKILL.md` before planning, editing,
reviewing or closing work.

## Recommended Starter Set

- `authority-chain`
- `project-rules-first`
- `plan-before-execution`
- `scope-and-blockers`
- `evidence-before-final`
- `executor-cannot-self-finish`
- `no-secrets`
- `session-output-contract`

## Safety

Claude should use target project commands from `project-profile.yaml`, CI or
project docs. Do not copy commands from this repository into a target project
unless they already exist there.
