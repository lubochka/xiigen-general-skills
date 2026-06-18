# Create Command Gate Skill

## Stack Scope
Use when a target project needs a skill that classifies commands as safe, approval-required, or forbidden.

## Required Project Discovery
Safe commands, approval-required commands, forbidden commands, destructive patterns, CI commands, local policy files.

## Skill Drafting Steps
1. Inventory documented commands.
2. Classify commands by risk.
3. Define output evidence for each command type.
4. Require explicit gates for destructive or broad commands.

## Command Safety
Never derive command permissions from another repo's settings file without parameterizing them.

## Verification
Verify against the target project, not this template:

1. Compare generated safe, approval-required, and forbidden command lists with `project-profile.yaml`.
2. Cross-check the lists against target CI files, package scripts, build files, or local policy docs.
3. Confirm every generated stack skill references this gate.
4. Add evidence to `ADAPTATION_REPORT.md`: checked files, mismatches, skipped commands, and unresolved blockers.

## Anti-Patterns
Making broad build/test/deploy commands universal; running destructive commands by path guess.
