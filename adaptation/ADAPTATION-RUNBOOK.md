# Adaptation Runbook

Use this runbook with Cursor, Claude, or Codex to adapt `xiigen-general-skills` into a target project.

## Inputs

- `adaptation/adaptation-map.yaml`
- `adaptation/project-profile.template.yaml`
- Target project rules and commands
- Target project architecture and stack facts

## Workflow

1. Set paths for the skills kit and target project:

```powershell
$KitRoot = "<path-to-xiigen-general-skills>"
$TargetRoot = "<path-to-target-project>"
$OutputDir = "adapted-output"
Set-Location $KitRoot
```

2. Copy `adaptation/project-profile.template.yaml` to the target project as `project-profile.yaml`.

```powershell
Copy-Item -LiteralPath "$KitRoot\adaptation\project-profile.template.yaml" -Destination "$TargetRoot\project-profile.yaml"
```

3. Fill stack, architecture, commands, CI, forbidden commands, approval-required commands, project rules, and evidence expectations in `$TargetRoot\project-profile.yaml`.
4. Filter the map: universal almost always; architecture by project type; stack only by actual stack; other as policy.
5. Resolve placeholders from `$TargetRoot\project-profile.yaml`.
6. Validate the map from the kit repo:

```powershell
Set-Location $KitRoot
.\scripts\validate-map.ps1
```

7. Generate a conservative adaptation report scaffold from the kit repo, using the target profile:

```powershell
Set-Location $KitRoot
.\scripts\render-adaptation.ps1 -TargetProjectProfile "$TargetRoot\project-profile.yaml" -OutputDir $OutputDir
```

8. Generate neutral files first. The output folder is `$KitRoot\$OutputDir`.
   The render script intentionally does not write the local target profile path
   into generated artifacts.
9. Choose the target adapter and follow its instructions:

| Target tool | Adapter instructions |
|---|---|
| Cursor | `adapters/cursor/run-adaptation.md` and `adapters/cursor/output-layout.md` |
| Claude | `adapters/claude/run-adaptation.md` and `adapters/claude/output-layout.md` |
| Codex | `adapters/codex/run-adaptation.md` and `adapters/codex/output-layout.md` |

Adapter inputs are `adaptation/adaptation-map.yaml`, `$TargetRoot\project-profile.yaml`, `$KitRoot\$OutputDir\selected-mappings.md`, and the neutral files generated in `$KitRoot\$OutputDir`.

10. Generate Cursor, Claude, or Codex outputs from the same entry ids by
    following the selected adapter instructions. Adapter-specific rendering is a
    manual review step after neutral artifacts are inspected.
11. Create `ADAPTATION_REPORT.md` with created, skipped, blocked, and manual follow-up sections.
12. Smoke-test one selected rule: the agent must name loaded rules, apply a relevant rule, and not apply an irrelevant one.
13. Update `ADAPTATION_REPORT.md` with the smoke-test prompt, actual response, pass/fail status, blockers, and evidence path.

## Completion Gate

Adaptation is not complete until `ADAPTATION_REPORT.md` explains created files, skipped entries, blockers, evidence, and remaining manual work.
