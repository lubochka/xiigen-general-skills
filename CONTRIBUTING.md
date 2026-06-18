# Contributing

This repository accepts changes only when the layer is explicit:

- `universal`: project-independent agent behavior.
- `architecture`: parameterized architecture template.
- `stack`: guide for creating a target-project stack skill.
- `other_policy`: evidence, generated material, legal/content, archive, or source-boundary policy.

## Required Checks

1. Update `index/SOURCE_COVERAGE.md` when adding source families.
2. Update `adaptation/adaptation-map.yaml` when adding an adaptable artifact.
3. Keep concrete commands out of universal skills.
4. Add review gates to every new skill or guide.
5. Run the release checklist in `docs/review-checklist.md`.
6. Do not commit secrets, local absolute paths, raw evidence, copied worktrees, generated bundles, or private prompts.

## Contribution License

By contributing, you agree that your contribution is licensed under the same
license as this repository: Apache License 2.0.

This repository currently uses an inbound=outbound contribution model. No CLA or
DCO is required unless maintainers later document a different model.

## AI-Generated Contributions

If you used AI tools to generate material parts of a contribution, disclose it
in the pull request. You remain responsible for ensuring the contribution is
original, lawful, safe, correct, and compatible with this repository's license.

## Confidential Material

Do not contribute employer or client confidential materials, customer source
code, internal evidence logs, private prompts, raw generated project bundles,
regulated data, or materials you are not authorized to share.

Security vulnerabilities must be reported privately according to `SECURITY.md`,
not through public issues or pull requests.

## Dependencies

Do not add new third-party dependencies without explaining the license, purpose,
security impact, and any required notice or attribution.

## Skill Format

Every skill must include purpose, when to use, inputs, steps, gates, evidence, anti-patterns, and related entries.
