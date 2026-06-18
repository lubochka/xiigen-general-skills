param(
    [string]$Root = (Split-Path -Parent $PSScriptRoot)
)

$ErrorActionPreference = "Stop"

$resolvedRoot = (Resolve-Path -LiteralPath $Root).Path
$selfPath = $MyInvocation.MyCommand.Path
$failures = New-Object System.Collections.Generic.List[string]

function Add-Failure {
    param([string]$Message)
    $script:failures.Add($Message) | Out-Null
}

function Get-RelativePath {
    param([string]$BasePath, [string]$FullPath)
    $base = $BasePath.TrimEnd("\", "/")
    if ($FullPath.StartsWith($base, [StringComparison]::OrdinalIgnoreCase)) {
        return $FullPath.Substring($base.Length).TrimStart("\", "/")
    }
    return $FullPath
}

& (Join-Path $PSScriptRoot "validate-map.ps1") -Root $resolvedRoot
if ($LASTEXITCODE -ne 0) {
    Add-Failure "adaptation map validation failed"
}

$requiredFiles = @(
    "LICENSE",
    "NOTICE",
    "TRADEMARKS.md",
    "SECURITY.md",
    "CODE_OF_CONDUCT.md",
    "THIRD_PARTY_NOTICES.md",
    "AI-SKILL-SAFETY-NOTICE.md",
    ".github/PULL_REQUEST_TEMPLATE.md",
    ".github/ISSUE_TEMPLATE/config.yml",
    ".github/ISSUE_TEMPLATE/bug_report.md",
    ".github/ISSUE_TEMPLATE/documentation_issue.md",
    ".github/ISSUE_TEMPLATE/security_notice.md",
    ".github/ISSUE_TEMPLATE/skill_improvement.md"
)

foreach ($relative in $requiredFiles) {
    $path = Join-Path $resolvedRoot $relative
    if (-not (Test-Path -LiteralPath $path)) {
        Add-Failure "missing required release file: $relative"
    }
}

$blockedPatterns = @(
    "UNLICENSED PRIVATE DRAFT",
    "Private draft repository",
    "\bprivate draft\b",
    "\bunlicensed\b",
    "\bdo not publish\b",
    "source-core/",
    "source-platform/",
    "docs/HOW",
    "docs/skills",
    "\.skills",
    "[A-Za-z]:\\\\",
    "C:/",
    "/Users/",
    "/home/",
    "file://",
    "AKIA",
    "-----BEGIN",
    "password\s*=",
    "token\s*=",
    "secret\s*="
)

$blockedCaseSensitivePatterns = @()

$excludedDirs = @(
    (Join-Path $resolvedRoot ".git")
)

$files = Get-ChildItem -LiteralPath $resolvedRoot -Recurse -File -Force | Where-Object {
    $path = $_.FullName
    if ($path -eq $selfPath) { return $false }
    foreach ($dir in $excludedDirs) {
        if ($path.StartsWith($dir, [StringComparison]::OrdinalIgnoreCase)) {
            return $false
        }
    }
    return $true
}

foreach ($file in $files) {
    try {
        $text = Get-Content -LiteralPath $file.FullName -Raw -ErrorAction Stop
    } catch {
        continue
    }

    foreach ($pattern in $blockedPatterns) {
        if ($text -match $pattern) {
            $relative = Get-RelativePath -BasePath $resolvedRoot -FullPath $file.FullName
            Add-Failure "blocked pattern '$pattern' found in $relative"
        }
    }
    foreach ($pattern in $blockedCaseSensitivePatterns) {
        if ($text -cmatch $pattern) {
            $relative = Get-RelativePath -BasePath $resolvedRoot -FullPath $file.FullName
            Add-Failure "blocked source-specific pattern '$pattern' found in $relative"
        }
    }
}

$mapPath = Join-Path $resolvedRoot "adaptation/adaptation-map.yaml"
$mapText = Get-Content -LiteralPath $mapPath -Raw
$sourceFamilyMatches = [regex]::Matches($mapText, "source_family:\s*\[([^\]]*)\]")
foreach ($match in $sourceFamilyMatches) {
    $values = $match.Groups[1].Value.Split(",") | ForEach-Object { $_.Trim() } | Where-Object { $_ }
    foreach ($value in $values) {
        if ($value -match "[\\/]|\.md\b|\.zip\b|\.csv\b") {
            Add-Failure "path-like source_family value in adaptation map: $value"
        }
    }
}

$futureUniversalSkills = @(
    "skills/universal/prompt-source-ledger/SKILL.md",
    "skills/universal/bug-to-regression-tests/SKILL.md",
    "skills/universal/change-impact-blast-radius/SKILL.md",
    "skills/universal/plan-self-validation/SKILL.md",
    "skills/universal/abstraction-level-scope-ladder/SKILL.md",
    "skills/universal/numeric-consistency-audit/SKILL.md",
    "skills/universal/output-falsifiability-gate/SKILL.md",
    "skills/universal/context-window-handoff/SKILL.md",
    "skills/universal/product-decision-gate/SKILL.md",
    "skills/universal/evidence-density-specificity/SKILL.md",
    "skills/universal/conversation-role-boundary/SKILL.md",
    "skills/universal/implementation-doc-readability/SKILL.md",
    "skills/universal/experiment-research-workflow/SKILL.md",
    "skills/universal/prerequisite-chain/SKILL.md",
    "skills/universal/delivery-round-trip-verification/SKILL.md",
    "skills/universal/progress-cycle-visibility/SKILL.md"
)

$skillsIndex = Get-Content -LiteralPath (Join-Path $resolvedRoot "index/SKILLS_INDEX.md") -Raw
foreach ($future in $futureUniversalSkills) {
    if ($skillsIndex.Contains($future)) {
        Add-Failure "future backlog skill is indexed as shipped: $future"
    }
    $futureParent = Split-Path -Parent $future
    $futureSlug = Split-Path -Leaf $futureParent
    $skillRowPattern = '(?m)^\|\s*`?' + [regex]::Escape($futureSlug) + '`?\s*\|'
    if ($skillsIndex -match $skillRowPattern) {
        Add-Failure "future backlog skill slug is indexed as shipped: $futureSlug"
    }
}

if ($failures.Count -gt 0) {
    Write-Host "FAIL: release hygiene scan found issues"
    foreach ($failure in $failures) {
        Write-Host "- $failure"
    }
    exit 1
}

Write-Host "PASS: release hygiene scan found no configured leaks or release-blocking stale markers."
