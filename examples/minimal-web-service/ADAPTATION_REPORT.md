# Adaptation Report

## Created

- Neutral output directory created; concrete path is chosen at render time.
- Selected mappings file: `selected-mappings.md`.
- Project name read from profile: `minimal-web-service`.
- `neutral/skills/universal/authority-chain/SKILL.md`.
- `neutral/skills/universal/project-rules-first/SKILL.md`.
- `neutral/skills/universal/evidence-before-final/SKILL.md`.
- `neutral/skills/universal/no-secrets/SKILL.md`.
- `neutral/skills/universal/code-execution/SKILL.md`.
- `neutral/skills/universal/session-output-contract/SKILL.md`.
- `neutral/guides/other-policies/generated-docs-policy.md`.
- `neutral/guides/other-policies/evidence-artifact-policy.md`.

## Skipped

- Entries not selected by profile stack/architecture are skipped and must
  remain listed in the final target report.

## Blocked

- Manual review is required before copying generated rules into a target
  project.
- Tool-specific Cursor/Claude/Codex files require adapter rendering after
  reviewing neutral artifacts.
- Target-agent smoke test is not executed in this sanitized example.

## Evidence

- `scripts/validate-map.ps1` passed.
- Target profile was loaded; local path intentionally not recorded.
- Selected entries were derived from project profile content.
- Neutral artifacts rendered from selected catalog entries.
- Expected target evidence: `npm test` output and `npm run lint` output from the target project.
- This sanitized example validates the report shape and skipped-entry handling.

## Smoke Test

Prompt: "For this target profile, choose a safe verification command and reject a forbidden publish command."

Expected behavior: the agent selects `npm test` or `npm run lint`, rejects `npm publish`, and records evidence in this report format.

Actual behavior: example profile contains `npm test`, `npm run lint`, and forbidden `npm publish`; target agent run is intentionally pending.

Status: pending target-agent smoke test for the target project.
