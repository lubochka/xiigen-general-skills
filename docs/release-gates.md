# Release Gates

Open-source licensing and public release readiness are separate gates.

- Repository license: Apache License 2.0.
- Public release readiness: complete only after sanitizer, provenance, contact, security, and legal review gates pass.

| Gate | Required Result |
|---|---|
| Index completeness | All skills/guides/templates are indexed |
| Source coverage | Every source family is classified |
| Taxonomy separation | Universal, architecture, stack, and other are not mixed |
| Secret scan | No tokens, credentials, keys, or private logs |
| Private path scan | No local absolute paths from source machines |
| Internal domain scan | No private hostnames or unpublished domains |
| Generated artifact scan | No raw generated docs, evidence bundles, models, or results |
| Binary/archive scan | No large raw zips, exports, models, or copied worktrees |
| Git history/export scan | Public release is made from a sanitized tree or reviewed/squashed history |
| Reusable-doc grep scan | No reusable docs match private path or secret patterns such as local absolute paths, local-file URI references, raw log/media/archive names, credential assignment markers, cloud key prefixes, or private key blocks |
| SPDX/license | Apache-2.0 license and notices present |
| Public repository files | `NOTICE`, `TRADEMARKS.md`, `SECURITY.md`, `CODE_OF_CONDUCT.md`, `THIRD_PARTY_NOTICES.md`, `AI-SKILL-SAFETY-NOTICE.md`, `.github` templates, and issue-template config present |
| Security contact | Monitored private security reporting channel selected before public release |
| Provenance | Source family and transformation type recorded |
| Adapter drift | Cursor/Claude/Codex outputs match canonical map meaning |
| Smoke test | Selected adapted rule activates correctly |

## Local Release Hygiene Command

Run the automated hygiene scan before publishing or tagging a release:

```powershell
.\scripts\release-hygiene-scan.ps1
```

This scan validates the adaptation map, required governance files, stale
private-draft markers, source/path/secret patterns, path-like `source_family`
metadata, and future backlog skills accidentally indexed as shipped.

## Current Status

| Target | Status | Evidence |
|---|---|---|
| Local project use | Pending current protection-plan review | `docs/review-checklist.md`, review records |
| Open-source license | Selected | `LICENSE`, `NOTICE` |
| Public/open-source release | Pending final release approval | Sanitizer, provenance, examples, security contact, git history/export, and legal review still required |

## Public Release Sanitizer

Before public release, replace sensitive source identifiers in metadata with
public aliases, remove local/source-project paths, review examples, publish a
private security reporting channel, and re-run secret/path/archive/generated
artifact scans. If repository history contains earlier unsanitized drafts,
publish from a fresh sanitized export or from reviewed/squashed history.
