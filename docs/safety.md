# Safety

XIIGen AI Agent Skills helps AI coding agents behave more carefully. It does
not replace human review, security review, legal review or production release
approval.

## Public Repository Boundary

Public reusable docs should avoid:

- secrets and credentials;
- private prompts;
- local absolute paths;
- raw logs and screenshots;
- generated private bundles;
- copied worktrees;
- customer data;
- model artifacts and datasets;
- internal project facts that are not meant for reuse.

## Target Project Boundary

When adapting this repository into a target project:

1. Read target project rules first.
2. Use commands from the target project, CI or docs.
3. Mark assumptions explicitly.
4. Keep architecture-specific guidance in target-specific files.
5. Keep stack-specific commands out of universal skills.
6. Run project verification before claiming completion.

## Evidence Is Not Approval

Logs, screenshots, reports, successful commands and generated artifacts can
support a claim. They do not approve the claim by themselves. Approval must come
from the project owner, maintainer, reviewer or documented release process.
