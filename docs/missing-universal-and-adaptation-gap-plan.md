# План публичного backlog для universal skills и adaptation guides

Дата обновления: 2026-06-18.

Этот документ является публичной, санитизированной версией backlog. Он не
публикует source family IDs, точные source inventory counts, source file names,
archive names, credential filenames, private paths, raw prompts, logs, datasets,
model artifacts или evidence bundles.

## Граница

В `skills/universal/` можно добавлять только переносимые правила поведения
агента, которые не зависят от языка, фреймворка, облака, runtime, конкретной
архитектуры, бренда, tenant/workflow/wiki/code-assistance названий или source
project contracts.

Архитектурные материалы остаются в `guides/architecture/` как templates.
Стековые материалы остаются в `guides/stack-skill-factories/` как инструкции по
созданию target-project skills на основании команд, CI и документации целевого
проекта.

## Публично покрыто сейчас

- Universal layer: authority, project rules, planning, evidence, review loop,
  scope/blockers, stale baseline guard, claim verification, no secrets,
  testing integrity, debugging, code safety, documentation sync, integration
  testing, user-journey testing, assumption/decision capture, delivery
  completeness and session output.
- Architecture layer: trainable/adaptive architecture, workflow/orchestration,
  checkpoint lifecycle, knowledge-base structure, skill orchestration,
  completion matrix, tenant/launch governance, plugin evidence, session-gated
  delivery.
- Stack layer: .NET/C#, cloud runtime evidence, container/export/import,
  frontend/UI evidence, trainable runtime, command gate, generic stack skill.
- Other/policy layer: source classification, generated docs, evidence
  artifacts, legal/content drafts, archived material, release gates and review
  checklist.

## P0: будущие universal skills

Эти элементы можно реализовывать как готовые `SKILL.md`, если при реализации не
попадают stack commands, architecture contracts или private source details.

| Future artifact | Purpose | Boundary |
|---|---|---|
| `skills/universal/prompt-source-ledger/SKILL.md` | Track requirements, source authority, replacement mapping and contradictions | No raw prompts or private project facts |
| `skills/universal/bug-to-regression-tests/SKILL.md` | Turn bugs into reproducible regression proof | No stack-specific test commands |
| `skills/universal/change-impact-blast-radius/SKILL.md` | Check change propagation and defense depth | No source module names |
| `skills/universal/plan-self-validation/SKILL.md` | Review plan completeness before execution | No fixed private review model |
| `skills/universal/abstraction-level-scope-ladder/SKILL.md` | Choose the right solution level and avoid scope drift | No source phase labels |
| `skills/universal/numeric-consistency-audit/SKILL.md` | Verify counts, matrices and artifact references | No historical source counts |
| `skills/universal/output-falsifiability-gate/SKILL.md` | Require falsifiable completion claims | No private evidence dumps |
| `skills/universal/context-window-handoff/SKILL.md` | Preserve resumable state across context changes | No raw session state |
| `skills/universal/product-decision-gate/SKILL.md` | Keep product decisions with the user/owner | No source product policy |
| `skills/universal/evidence-density-specificity/SKILL.md` | Require enough specific evidence without noisy dumps | No mandatory private formats |
| `skills/universal/conversation-role-boundary/SKILL.md` | Clarify conversation mode and role boundaries | No private self-reflection prompts |
| `skills/universal/implementation-doc-readability/SKILL.md` | Keep implementation docs human-readable and traceable | No source diagrams as authority |
| `skills/universal/experiment-research-workflow/SKILL.md` | Structure research/experiment cycles | No raw datasets, results or model artifacts |
| `skills/universal/prerequisite-chain/SKILL.md` | Track blocking dependencies before execution | No source dependency names |
| `skills/universal/delivery-round-trip-verification/SKILL.md` | Verify request -> artifact -> implementation -> docs -> evidence | No build/package commands |
| `skills/universal/progress-cycle-visibility/SKILL.md` | Make progress and cycle state visible | No historical counters |

## P0: architecture guide backlog

These are adaptation templates, not ready universal skills.

| Future guide | Purpose |
|---|---|
| `guides/architecture/context-selection-and-routing-template.md` | Adapt context selection, routing and skill selection |
| `guides/architecture/multi-agent-orchestration-template.md` | Adapt safe multi-agent coordination and review gates |
| `guides/architecture/ai-pipeline-arbiter-template.md` | Adapt AI pipeline arbitration and escalation |
| `guides/architecture/capability-learning-lifecycle-template.md` | Adapt capability improvement and learning lifecycle |
| `guides/architecture/graph-event-data-flow-template.md` | Adapt graph, event, data-flow and traceability design |
| `guides/architecture/session-phase-lifecycle-template.md` | Adapt formal session/phase lifecycle when a target project needs it |
| `guides/architecture/prompt-by-prompt-validation-template.md` | Adapt prompt-suite validation without publishing private prompts |
| `guides/architecture/linked-system-graph-template.md` | Adapt linked system graph and authority questions |
| `guides/architecture/tenant-adaptation-studio-template.md` | Adapt tenant/customization workflow when relevant |
| `guides/architecture/knowledge-base-runtime-template.md` | Adapt knowledge-base runtime surfaces and citation behavior |
| `guides/architecture/code-assistance-runtime-template.md` | Adapt code-assistance planning, policy and validation flow |
| `guides/architecture/trainable-unit-registry-locator-template.md` | Adapt manifest, registry and locator concepts without raw artifacts |
| `guides/architecture/translation-domain-template.md` | Adapt translation/domain architecture only when present in target project |

## P0: stack factory backlog

These guides teach how to create project-specific skills from the target
project. They must not hardcode commands from source material.

| Future guide | Purpose |
|---|---|
| `guides/stack-skill-factories/create-dotnet-governance-skill.md` | Create a .NET/C# governance skill from target project rules |
| `guides/stack-skill-factories/create-agent-runtime-skill.md` | Create an agent/tooling runtime skill for the selected stack |
| `guides/stack-skill-factories/create-frontend-ui-quality-skill.md` | Create frontend/UI quality skill for the actual UI stack |
| `guides/stack-skill-factories/create-ide-plugin-host-evidence-skill.md` | Create IDE/plugin-host evidence skill |
| `guides/stack-skill-factories/create-cloud-cicd-provenance-skill.md` | Create cloud/CI/CD provenance evidence skill |
| `guides/stack-skill-factories/create-public-endpoint-visual-evidence-skill.md` | Create public endpoint evidence skill for a target runtime |
| `guides/stack-skill-factories/create-signed-export-package-skill.md` | Create package integrity/signature/no-secrets skill |
| `guides/stack-skill-factories/create-corporate-install-import-verifier-skill.md` | Create install/import verification skill |
| `guides/stack-skill-factories/create-update-reexport-lifecycle-skill.md` | Create update/re-export lifecycle skill |

## Other policy backlog

| Future policy | Purpose |
|---|---|
| `guides/other-policies/legal-publication-acceptance-policy.md` | Capture approval/version/localization process without legal advice |
| `guides/other-policies/marketplace-provenance-policy.md` | Capture provenance/listing/readback/fork policy |
| `guides/other-policies/archive-secret-source-policy.md` | Keep credential-bearing archives and private bundles out of reusable docs |
| `guides/other-policies/training-data-and-metrics-policy.md` | Treat metrics/training docs as reference-only without raw data/models |

## Execution order

1. Update source coverage using public buckets only.
2. Implement new universal skills only when their content is project-independent.
3. Add architecture guides only to guide indexes and the adaptation map.
4. Add stack guides only to guide indexes and the adaptation map.
5. Run `scripts/validate-map.ps1`.
6. Run `scripts/release-hygiene-scan.ps1`.
7. Review examples and generated output for private paths, raw prompts, source
   artifact names, exact source inventory counts and credentials.
8. Record any blocked public-release gate in `docs/release-gates.md`.

## Done condition

- Ready skills are universal-only.
- Architecture and stack items remain adaptable guides/factories.
- Future backlog is not indexed as shipped.
- Public docs do not expose source family IDs, exact source inventory counts,
  source paths, source artifact names, raw prompts, credentials, datasets,
  generated evidence or private project facts.
