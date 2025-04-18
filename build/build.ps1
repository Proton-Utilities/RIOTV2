# RIOT V2 Build Composer (powershell rewrite)

$ErrorActionPreference = 'Stop'

function Prompt-Build {
    Write-Host "[INPUT] Build type (R/Release) (D/Debug):"
    $input = Read-Host
    switch -Regex ($input.ToLower()) {
        '^r(elease)?$' { return 'Release' }
        '^d(ebug)?$'   { return 'Debug' }
        default        {
            Write-Error "Invalid build type. Use: R, Release, D, Debug"
            exit 1
        }
    }
}

function Prompt-Version {
    Write-Host "[INPUT] Build version (v.MAJOR.MINOR.PATCH eg: v1.0.0/v1.0.0-beta.2)"
    return Read-Host
}

function Rep-Markers ($content, $buildType, $buildVersion) {
    return $content | ForEach-Object {
        ($_ -replace '#- COMPOSER\[(GET\s+BUILD[_\s]+TYPE)\] -#', "'$buildType'") `
        -replace '#- COMPOSER\[(GET\s+BUILD[_\s]+VERSION)\] -#', $(if ($buildVersion) { "'$buildVersion'" } else { "nil" })      
    }
}

function Get-LineIndentation {
    param([string]$line)
    if ($line -match '^(\s+)') {
        return $matches[1]
    }
    return ''
}

function Extract {
    param (
        [string]$marker,
        [string]$splitFile
    )

    $lines = Get-Content $splitFile | Where-Object { $_ -notmatch '^\s*--!' }
    $pre = [System.Collections.ArrayList]::new()
    $post = [System.Collections.ArrayList]::new()
    $isMarker = $false
    $inMultilineComment = $false
    $indentation = ''
    
    foreach ($line in $lines) {
        if ($line -match '--\[\[') {
            $inMultilineComment = $true
            $pre.Add($line) | Out-Null
            continue
        }
        if ($line -match '\]\]') {
            $inMultilineComment = $false
            if (-not $isMarker) {
                $pre.Add($line) | Out-Null
            } else {
                $post.Add($line) | Out-Null
            }
            continue
        }

        if ($line -match '^\s*--' -or $inMultilineComment) {
            if (-not $isMarker) {
                $pre.Add($line) | Out-Null
            } else {
                $post.Add($line) | Out-Null
            }
            continue
        }

        if ($line -match $marker) {
            $isMarker = $true
            $indentation = Get-LineIndentation $line
            continue
        }
        
        if (-not $isMarker) {
            $pre.Add($line) | Out-Null
        } else {
            $post.Add($line) | Out-Null
        }
    }
    
    return @($pre, $post, $indentation)
}

$buildType     = Prompt-Build
$buildVersion  = if ($buildType -eq 'Release') { Prompt-Version } else { $null }

Write-Host "[PROCESSING] Bundling $buildType build..."

$tempDist = "$PSScriptRoot\dist.luau.tmp"
$splitMarker = '#- COMPOSER\[INSERT\s*\(BUILD\)\] -#'

if (-not (Get-Command darklua -ErrorAction SilentlyContinue)) {
    Write-Error "Error: darklua not found. Ensure it's in your PATH."
    exit 1
}

darklua process ../src/init.luau $tempDist -c .darklua.json > $null

if (-not (Test-Path $tempDist)) {
    Write-Error "Error: dist.luau not found"
    exit 1
}

Write-Host "[PROCESSING] Extracting splitter..."
$splitSegments = Extract -marker $splitMarker -splitFile "split.luau"

Write-Host "[PROCESSING] Composing output..."

$distContent = Get-Content $tempDist | ForEach-Object { "$($splitSegments[2])$_" }
$rawContent = @()
$rawContent += Get-Content header.luau
$rawContent += $splitSegments[0]
$rawContent += $distContent
$rawContent += $splitSegments[1]

$distribution = Rep-Markers $rawContent $buildType $buildVersion
$distribution | Set-Content ../dist.luau -Encoding UTF8

Remove-Item $tempDist -Force

Write-Host "[SUCCESS] Build complete! Output: ..\dist.luau"
exit 0