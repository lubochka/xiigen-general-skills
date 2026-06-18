# Source Material Classification

Use this classification before adding source-derived material.

| Status | Meaning |
|---|---|
| `extract` | Portable rule can become a universal skill. |
| `parameterize` | Source becomes an architecture template or stack guide. |
| `reference_only` | Source informs policy/examples but is not reusable guidance. |
| `exclude` | Source must not be carried forward. |
| `not_present` | Source family was checked and absent. |

## Required Fields

`source_family`, `source_project`, `status`, `layer`, `target_artifact`, `sanitizer_notes`, `provenance`, `license_status`.

## Gates
All source families are classified before release.

