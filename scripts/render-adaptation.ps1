param(
    [Parameter(Mandatory = $true)]
    [string]$TargetProjectProfile,

    [string]$Root = (Split-Path -Parent $PSScriptRoot),
    [string]$OutputDir = "adapted-output"
)

$ErrorActionPreference = "Stop"
& (Join-Path $PSScriptRoot "validate-map.ps1") -Root $Root
if ($LASTEXITCODE -ne 0) {
    throw "Map validation failed."
}

if (-not (Test-Path -LiteralPath $TargetProjectProfile)) {
    throw "Target project profile not found: $TargetProjectProfile"
}

$profileText = Get-Content -LiteralPath $TargetProjectProfile -Raw
$mapText = Get-Content -LiteralPath (Join-Path $Root "adaptation/adaptation-map.yaml") -Raw

$projectName = "target-project"
if ($profileText -match "(?m)^\s+name:\s+[`"']?([^`"'\r\n]+)[`"']?\s*$") {
    $projectName = $Matches[1].Trim()
}
$targetProfileLabel = "target project profile (path intentionally not recorded)"

$selected = New-Object System.Collections.Generic.List[string]
foreach ($id in @(
    "universal.authority-chain",
    "universal.project-rules-first",
    "universal.evidence-before-final",
    "universal.no-secrets",
    "universal.code-execution",
    "universal.session-output-contract",
    "other.generated-docs-policy",
    "other.evidence-artifact-policy"
)) {
    $selected.Add($id)
}
if ($profileText -match "(?i)csharp|\.NET|dotnet") { $selected.Add("stack.dotnet-csharp") }
if ($profileText -match "(?i)aws") { $selected.Add("stack.aws-runtime-evidence") }
if ($profileText -match "(?i)docker|compose|container") { $selected.Add("stack.docker-export-import") }
if ($profileText -match "(?i)\b(angular|frontend|ui)\b") { $selected.Add("stack.angular-ui-evidence") }
if ($profileText -match "(?i)ai-orchestration|trainable") {
    $selected.Add("architecture.trainable-architecture")
    $selected.Add("architecture.logical-unit-flow-machine")
    $selected.Add("architecture.smart-skills-orchestration")
}

$catalog = @{}
[regex]::Matches($mapText, "\{ id: ([^,\}]+), path: ([^,\}]+) \}") | ForEach-Object {
    $catalog[$_.Groups[1].Value.Trim()] = $_.Groups[2].Value.Trim()
}

$out = Join-Path $Root $OutputDir
New-Item -ItemType Directory -Force -Path $out | Out-Null

$selectedLines = foreach ($id in ($selected | Select-Object -Unique)) {
    $path = if ($catalog.ContainsKey($id)) { $catalog[$id] } else { "missing-catalog-path" }
    "- $id -> $path"
}

Set-Content -LiteralPath (Join-Path $out "selected-mappings.md") -Value (("# Selected Mappings for {0}`n`n" -f $projectName) + ($selectedLines -join "`n")) -Encoding UTF8

$createdFiles = New-Object System.Collections.Generic.List[string]
foreach ($id in ($selected | Select-Object -Unique)) {
    if (-not $catalog.ContainsKey($id)) {
        continue
    }
    $relative = $catalog[$id]
    $source = Join-Path $Root $relative
    if (-not (Test-Path -LiteralPath $source)) {
        continue
    }
    $target = Join-Path $out (Join-Path "neutral" $relative)
    New-Item -ItemType Directory -Force -Path (Split-Path -Parent $target) | Out-Null
    $body = Get-Content -LiteralPath $source -Raw
    $body = $body.Replace("<target-project-name>", $projectName)
    $body = $body.Replace("<project-name>", $projectName)
    $header = @"
<!--
Adapted for: $projectName
Map entry: $id
Source artifact: $relative
Target profile: $targetProfileLabel
-->

"@
    Set-Content -LiteralPath $target -Value ($header + $body) -Encoding UTF8
    $createdFiles.Add(("neutral/" + $relative))
}

$createdList = if ($createdFiles.Count -gt 0) {
    ($createdFiles | ForEach-Object { "- $_" }) -join "`n"
} else {
    "- No neutral artifacts rendered"
}

$report = @"
# Adaptation Report

## Created

- Output directory: $OutputDir
- Selected mappings file: selected-mappings.md
- Project name read from profile: $projectName
$createdList

## Skipped

- Entries not selected by profile stack/architecture are skipped and must remain listed in the final target report.

## Blocked

- Manual review required before copying generated rules into a target project.
- Tool-specific Cursor/Claude/Codex files require adapter rendering after reviewing neutral artifacts.

## Evidence

- scripts/validate-map.ps1 passed.
- Target profile was loaded; local path intentionally not recorded.
- Selected entries were derived from project profile content.
- Neutral artifacts rendered from selected catalog entries.

## Smoke Test

Prompt: Ask the target agent to name selected rules, apply one relevant rule, and reject one irrelevant rule.
Expected behavior: agent uses selected-mappings.md and refuses unrelated stack entries.
Actual behavior: pending target-agent run.
Status: pending_manual_smoke_test
"@

Set-Content -LiteralPath (Join-Path $out "ADAPTATION_REPORT.md") -Value $report -Encoding UTF8
Write-Host "PASS: wrote $OutputDir/ADAPTATION_REPORT.md"
