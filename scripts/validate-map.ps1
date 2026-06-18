param(
    [string]$Root = (Split-Path -Parent $PSScriptRoot)
)

$ErrorActionPreference = "Stop"
$mapPath = Join-Path $Root "adaptation/adaptation-map.yaml"
$text = Get-Content -LiteralPath $mapPath -Raw
$errors = New-Object System.Collections.Generic.List[string]

foreach ($required in @(
    "schema_version:",
    "map_id:",
    "canonical_version:",
    "required_entry_fields:",
    "quality_gate_definitions:",
    "artifact_catalog:",
    "entries:"
)) {
    if ($text -notmatch [regex]::Escape($required)) {
        $errors.Add("Missing map section: $required")
    }
}

$catalogIds = [regex]::Matches($text, "\{ id: ([^,\}]+), path: ([^,\}]+) \}") |
    ForEach-Object {
        [pscustomobject]@{
            Id = $_.Groups[1].Value.Trim()
            Path = $_.Groups[2].Value.Trim()
        }
    }

$entriesStart = $text.IndexOf("entries:")
$entriesText = if ($entriesStart -ge 0) { $text.Substring($entriesStart) } else { "" }

foreach ($item in $catalogIds) {
    $full = Join-Path $Root $item.Path
    if (-not (Test-Path -LiteralPath $full)) {
        $errors.Add("Catalog path missing: $($item.Id) -> $($item.Path)")
    }
    if ($entriesText -notmatch ("id:\s+" + [regex]::Escape($item.Id))) {
        $errors.Add("Catalog id missing executable entry: $($item.Id)")
    }
}

$requiredEntryFields = @(
    "layer:",
    "artifact_type:",
    "source_family:",
    "portability:",
    "purpose:",
    "applies_when:",
    "parameters_required:",
    "workflow_stage:",
    "render:",
    "activation:",
    "dependencies:",
    "conflicts:",
    "quality_gates:",
    "status:",
    "notes:"
)

foreach ($field in $requiredEntryFields) {
    if ($text -notmatch [regex]::Escape($field)) {
        $errors.Add("Required entry field not found anywhere: $field")
    }
}

$entryMatches = [regex]::Matches($entriesText, "(?ms)^\s*-\s+(?:\{\s*)?id:\s+(.+?)(?=^\s*-\s+(?:\{\s*)?id:|\z)")
foreach ($match in $entryMatches) {
    $entryText = $match.Value
    $idLine = ($entryText -split "`r?`n")[0].Trim()
    foreach ($field in $requiredEntryFields) {
        if ($entryText -notmatch [regex]::Escape($field)) {
            $errors.Add("Entry missing required field $field in $idLine")
        }
    }
}

$lines = $text -split "`r?`n"
$definedGates = New-Object System.Collections.Generic.HashSet[string]
$inGateDefinitions = $false
foreach ($line in $lines) {
    if ($line -match "^quality_gate_definitions:\s*$") {
        $inGateDefinitions = $true
        continue
    }
    if ($inGateDefinitions -and $line -match "^[a-zA-Z_].*:\s*$") {
        $inGateDefinitions = $false
    }
    if ($inGateDefinitions -and $line -match "^\s{2}([a-zA-Z0-9_]+):\s*$") {
        [void]$definedGates.Add($Matches[1])
    }
}

$referencedGates = New-Object System.Collections.Generic.HashSet[string]
$inCommonGates = $false
foreach ($line in $lines) {
    if ($line -match "^common_quality_gates:\s*$") {
        $inCommonGates = $true
        continue
    }
    if ($inCommonGates -and $line -match "^[a-zA-Z_].*:\s*$") {
        $inCommonGates = $false
    }
    if ($inCommonGates -and $line -match "^\s+-\s+([a-zA-Z0-9_]+)\s*$") {
        [void]$referencedGates.Add($Matches[1])
    }
    if ($line -match "quality_gates:\s*\[([^\]]*)\]") {
        foreach ($gate in ($Matches[1] -split ",")) {
            $name = $gate.Trim()
            if ($name.Length -gt 0) {
                [void]$referencedGates.Add($name)
            }
        }
    }
}

foreach ($gate in $referencedGates) {
    if (-not $definedGates.Contains($gate)) {
        $errors.Add("Quality gate is referenced but not defined: $gate")
    }
}

foreach ($gate in $definedGates) {
    $pattern = "(?ms)^\s{2}" + [regex]::Escape($gate) + ":\s*(.*?)(?=^\s{2}[a-zA-Z0-9_]+:\s*|^artifact_catalog:|^\S|\z)"
    $m = [regex]::Match($text, $pattern)
    if (-not $m.Success) {
        $errors.Add("Quality gate definition block not found: $gate")
        continue
    }
    foreach ($field in @("severity:", "pass:", "evidence:")) {
        if ($m.Value -notmatch [regex]::Escape($field)) {
            $errors.Add("Quality gate definition missing $field for $gate")
        }
    }
}

foreach ($mode in @("always", "explicit_skill", "path_scoped", "manual")) {
    if (-not [regex]::IsMatch($text, ("^\s{2}" + [regex]::Escape($mode) + ":\s*$"), [System.Text.RegularExpressions.RegexOptions]::Multiline)) {
        $errors.Add("Activation mode is missing from activation_mode_schema: $mode")
    }
}

if ($errors.Count -gt 0) {
    Write-Host "FAIL"
    $errors | ForEach-Object { Write-Host "- $_" }
    exit 1
}

Write-Host "PASS: adaptation map catalog paths and executable entries are present."
exit 0
