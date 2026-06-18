# Claude Adaptation

Use `adaptation/ADAPTATION-RUNBOOK.md` and `adaptation/adaptation-map.yaml` as canonical input.

## Output Layout

- `CLAUDE.md` for durable project facts.
- `.claude/skills/<skill-name>/SKILL.md` for procedural skills.

## Rules

1. Every generated skill must reference the map entry id and canonical version.
2. Durable facts go to `CLAUDE.md`; procedures go to skills.
3. Do not fork content manually from the canonical map.

