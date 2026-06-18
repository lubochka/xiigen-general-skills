# Review Checklist

Run this checklist before considering execution complete.

| # | Check | Pass Condition |
|---|---|---|
| 1 | Repository skeleton | Required directories and files exist, including OSS governance files and `.github` templates |
| 2 | Universal completeness | Current universal skills are indexed, and source-derived universal gaps are tracked in `docs/missing-universal-and-adaptation-gap-plan.md` |
| 3 | Architecture templates | Current templates are indexed, and architecture-dependent backlog items are guides/templates only |
| 4 | Stack guides | Current stack-skill factory guides are indexed, and stack-dependent backlog items forbid copied source commands |
| 5 | Other policies | Generated/evidence/legal/archive/source policies exist |
| 6 | Adaptation map | Required fields, entries, gates, and output contracts exist |
| 7 | Runbook/README | A user can run adaptation from profile to smoke-test |
| 8 | Tool adapters | Cursor/Claude/Codex adapters use one canonical map |
| 9 | Hygiene | `scripts/release-hygiene-scan.ps1` passes, and no secrets, private paths, raw evidence, copied worktrees, generated bundles, stale pre-release license text, or unresolved public-release contact fields are treated as complete |
| 10 | Requirements traceability | Every user requirement is tied to an artifact, guide, policy, skip/exclude/reference reason, or backlog item, including universal-only skills, architecture guides, stack adaptation guides, mapping/README usage, source aliases, source archive material, OSS governance files, and independent review records |
