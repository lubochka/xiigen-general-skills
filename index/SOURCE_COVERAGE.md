# Source Coverage

This file tracks source families that informed the repository. It is intentionally sanitized and does not publish source project content.

Status values:

- `extract`: reusable rule extracted.
- `parameterize`: converted into a template or guide.
- `reference_only`: used only as policy/example input.
- `exclude`: intentionally not carried forward.

Source aliases:

- `source-core`: private local source repo with preferred agent settings.
- `source-platform`: private local source repo for the main platform.

| Source family | Source project | Status | Layer | Target artifact | Transformation / provenance | Sanitizer notes | License status |
|---|---|---|---|---|---|---|---|
| Root agent guidance | `source-core`, `source-platform` | `extract` | universal | `authority-chain`, `project-rules-first` | Rules summarized, not copied wholesale | Remove private paths and project-only terms | Private input |
| Skill loading and usage docs | both | `extract` | universal | loading order skills | Loading logic generalized | No source text copied as-is | Private input |
| Session startup universal rules | both | `extract` | universal | session skills | Universal protocol extracted | Session-specific evidence removed | Private input |
| Session startup architecture workflow | both | `parameterize` | architecture | session-gated delivery | Phase/session workflow converted to a template | Source phase names are examples only | Private input |
| Session startup stack/runtime workflow | both | `parameterize` | stack | stack-skill factory guides | Runtime-specific checks converted to factory guidance | Commands must come from target project | Private input |
| Universal skill files | `source-core` | `extract` | universal | skills and gap plan | Portable skills extracted or queued in gap plan | Remove local paths and implementation-only examples | Private input |
| Architecture-dependent skill files | `source-core` | `parameterize` | architecture | templates and gap plan | Architecture rules converted into adaptation guides | Source architecture names are examples only | Private input |
| Stack-dependent skill files | `source-core` | `parameterize` | stack | stack factory guides and gap plan | Stack rules converted into factory guidance | Commands and local settings not copied | Private input |
| Server library README/manifest | `source-core` | `parameterize` | architecture | skill-selection matrix | Manifest concept generalized | No raw manifest publication | Private input |
| Architecture docs and contracts | both | `parameterize` | architecture | architecture templates | Concepts rewritten as questions and placeholders | XIIGen-only terms forbidden as requirements | Private input |
| Enterprise architecture contracts | `source-platform` | `parameterize` | architecture | current completion, tenant, wiki, skill-orchestration templates plus guide backlog | Contract families split by shipped templates and future guide backlog | Internal launch details removed | Private input |
| Enterprise stack/evidence contracts | `source-platform` | `parameterize` | stack | current evidence/export factory guides plus install/import guide backlog | Runtime and package evidence converted to shipped factories or future factory backlog | No account ids, configs, logs, screenshots, or packages | Private input |
| Enterprise legal/publication contracts | `source-platform` | `reference_only` | other | legal and publication policies | Workflow only, not legal content | Draft text excluded | Private input |
| .NET/C# rules | both | `parameterize` | stack | `.NET` stack guide | Commands replaced with target profile placeholders | No copied command list | Private input |
| AWS/runtime evidence | `source-platform` | `parameterize` | stack | AWS evidence guide | Evidence workflow generalized | No account ids, configs, logs | Private input |
| Docker/export/import | `source-platform` | `parameterize` | stack | Docker/export guide | Lifecycle generalized | No raw packages or compose content | Private input |
| Angular/UI evidence | `source-platform` | `parameterize` | stack | UI evidence guide | Visual evidence protocol generalized | No raw screenshots | Private input |
| Command tooling/settings | both | `parameterize` | stack | command-gate guide | Permission model generalized | Local settings not published | Private input |
| Prompt suite material | `source-platform` | `reference_only` | other | generated/source policy | Used only for sanitized examples | No private prompts | Private input |
| Trainable unit material | `source-platform` | `reference_only` | other | trainable template examples | Manifest idea generalized elsewhere | No raw manifests | Private input |
| Wiki-domain generated material | `source-platform` | `reference_only` | other | generated docs policy | Generated material classified | No raw generated corpus | Private input |
| Training data, models, experiments, results, generated artifacts | `source-core` | `reference_only` | other | evidence/generated policies | Artifact categories only | Raw artifacts excluded | Private input |
| Legal/content drafts | `source-platform` | `reference_only` | other | legal-content policy | Handling process generalized | Draft text excluded | Private input |
| Repository governance draft categories | governance draft package | `reference_only` | other | root OSS governance files, GitHub templates | Repository-specific notices and community policies summarized from approved categories | Commercial product terms are excluded | Draft legal input; repository output Apache-2.0 |
| Archived plans and zips | both | `reference_only` | other | archived-plan policy | Historical status generalized | Raw archives excluded | Private input |
| Source archive universal patterns | user-provided source archive material | `extract` | universal | gap expansion plan | Universal session, skill-usage, stale-baseline and reusable behavior patterns reviewed for extraction | No source text copied verbatim | Private input |
| Source archive architecture and stack patterns | user-provided source archive material | `parameterize` | architecture / stack | gap expansion plan | Non-universal patterns converted to guide backlog | Commands and source architecture terms are placeholders | Private input |
| Source archive historical examples | user-provided source archive material | `reference_only` | other | archived/source policies | Historical examples used only to classify public-safe patterns | Project state and private context excluded | Private input |
| Source archive private/raw material | user-provided source archive material | `exclude` | other | no publication | Credentials, raw generated bundles, raw baselines, private prompts and project-specific bodies are out of scope | Do not read, copy, cite, or index secrets | Private input |
| Source skill family ledger | source aliases and source archive material | `reference_only` | coverage | `index/SOURCE_SKILL_FAMILY_LEDGER.md` | Public bucket summary only; exact source family IDs and counts are retained outside reusable docs | No source paths, source bodies, prompts, logs, datasets, credentials, evidence artifacts, or exact inventory counts | Private input |
| Copied worktrees | both | `exclude` | other | no publication | Exclusion recorded | Never publish | Private input |

## Checked Absent

| Checked item | Source project | Note |
|---|---|---|
| repository automation metadata and standalone root skill file when absent | both | Absence recorded during inventory; not a source-family transformation. |
