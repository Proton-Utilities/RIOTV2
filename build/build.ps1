# RIOT V2 Build Composer (powershell rewrite)

$ErrorActionPreference = 'Stop'

$script:Markers = @{}

$config = Get-Content "$PSScriptRoot\config.json" | ConvertFrom-Json

function Push-Marker {
    param(
        [string]$name,
        [string]$pattern
    )
    $script:Markers[$name] = "__COMPOSER : INSERT '$pattern'"
}

function BType-Input {
    while ($true) {
        Write-Host "[INPUT] Build type (R/Release) (D/Debug):"
        $input = Read-Host
        switch -Regex ($input.ToLower()) {
            '^r(elease)?$' { return 'Release' }
            '^d(ebug)?$'   { return 'Debug' }
            default        {
                Write-Host "[ERROR] Invalid build type. Please enter 'R' for Release or 'D' for Debug."
                continue
            }
        }
    }
}
function BVersion-Input {
    Write-Host "[INPUT] Build version (v.MAJOR.MINOR.PATCH eg: v1.0.0/v1.0.0-beta.2)"
    return Read-Host
}

function Release-Input {
    if (-not $config.deployment.enabled) {
        Write-Host "`n[INFO] Deployment is disabled."
        return $false
    }

    Write-Host "`n[INPUT] Do you want to release this build to the public? (Y/N):"
    $input = Read-Host
    if ($input.ToLower() -notmatch '^y(es)?$') {
        return $false
    }

    Write-Host "`n[INPUT] Are you sure? (Y/N):"
    $input = Read-Host
    if ($input.ToLower() -notmatch '^y(es)?$') {
        return $false
    }

    $expected = "$($config.deployment.github.owner)/$($config.deployment.github.repo)"
    Write-Host "[INPUT] Type '$expected' to proceed:"
    $input = Read-Host

    
    if ($input -ne $expected) {
        return $false
    }    

    return $true
}

function Rep-Markers ($content, $buildType, $buildVersion) {
    $result = $content
    $result = $result -replace $script:Markers["BUILD_TYPE"], "'$buildType'"
    $result = $result -replace $script:Markers["BUILD_VERSION"], $(if ($buildVersion) { "'$buildVersion'" } else { "nil" })
    return $result
}

function Read-LIndent {
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

    $lines = Get-Content $splitFile
    $pre = [System.Collections.ArrayList]::new()
    $post = [System.Collections.ArrayList]::new()
    $isMarker = $false
    $inMLComment = $false
    $indentation = ''
    
    foreach ($line in $lines) {
        if ($line -match '--\[\[') {
            $inMLComment = $true
            $pre.Add($line) | Out-Null
            continue
        }
        if ($line -match '\]\]') {
            $inMLComment = $false
            if (-not $isMarker) {
                $pre.Add($line) | Out-Null
            } else {
                $post.Add($line) | Out-Null
            }
            continue
        }

        if ($line -match $marker) {
            $isMarker = $true
            $indentation = Read-LIndent $line
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

function Distribute-Github {
    param (
        [string]$version,
        [string]$distPath
    )
    
    if (-not $config.deployment.github.enabled) {
        Write-Host "[INFO] GitHub distribution is disabled"
        return $true
    }

    try {
        Write-Host "[GITHUB] Attempting to create release with version $version"
        
        $headers = @{
            "Accept" = "application/vnd.github.v3+json"
            "Authorization" = "Bearer $($config.deployment.github.apiKey)"
        }

        try {
            $testUrl = "$($config.deployment.github.apiUrl)/repos/$($config.deployment.github.owner)/$($config.deployment.github.repo)"
            Write-Host "[GITHUB] Testing API connection..."
            $repoTest = Invoke-RestMethod -Uri $testUrl -Headers $headers -Method Get
            Write-Host "[GITHUB] Successfully connected to repository: $($repoTest.full_name)"
        }
        catch {
            Write-Host "[ERROR] Failed to connect to GitHub API. Details:"
            Write-Host "Status Code: $($_.Exception.Response.StatusCode.value__)"
            Write-Host "Status Description: $($_.Exception.Response.StatusDescription)"
            $reader = New-Object System.IO.StreamReader($_.Exception.Response.GetResponseStream())
            $reader.BaseStream.Position = 0
            $reader.DiscardBufferedData()
            $responseBody = $reader.ReadToEnd()
            Write-Host "Response Body: $responseBody"
            throw "GitHub API connection failed"
        }

        $releaseData = @{
            tag_name = $version
            name = "RIOT $version"
            body = "Release notes for $version"
            draft = $false
            prerelease = $version -match "-"
        } | ConvertTo-Json

        Write-Host "[GITHUB] Creating release..."
        $releaseUrl = "$($config.deployment.github.apiUrl)/repos/$($config.deployment.github.owner)/$($config.deployment.github.repo)/releases"
        $release = Invoke-RestMethod -Uri $releaseUrl -Method Post -Headers $headers -Body $releaseData -ContentType "application/json"
        Write-Host "[GITHUB] Release created successfully"

        Write-Host "[GITHUB] Uploading distribution file..."
        $uploadUrl = $release.upload_url -replace '\{\?.*\}', ''
        $uploadUrl += "?name=dist.luau"

        $fileBytes = [System.IO.File]::ReadAllBytes($distPath)
        $response = Invoke-RestMethod -Uri $uploadUrl -Method Post -Headers $headers -Body $fileBytes -ContentType "application/octet-stream"
        Write-Host "[GITHUB] File uploaded successfully"

        Write-Host "[SUCCESS] Release $version published to GitHub"
        return $true
    }
    catch {
        Write-Host "[ERROR] Failed to create GitHub release. Details:"
        Write-Host "Error Message: $($_.Exception.Message)"
        if ($_.Exception.Response) {
            Write-Host "Status Code: $($_.Exception.Response.StatusCode.value__)"
            Write-Host "Status Description: $($_.Exception.Response.StatusDescription)"
            $reader = New-Object System.IO.StreamReader($_.Exception.Response.GetResponseStream())
            $reader.BaseStream.Position = 0
            $reader.DiscardBufferedData()
            $responseBody = $reader.ReadToEnd()
            Write-Host "Response Body: $responseBody"
        }
        return $false
    }
}

function Distribute-Luarmor {
    param (
        [string]$version,
        [string]$distPath
    )
    
    if (-not $config.deployment.luarmor.enabled) {
        Write-Host "[INFO] Luarmor distribution is disabled"
        return $true
    }

    try {
        Write-Host "[LUARMOR] Attempting to update script version $version"
        
        $headers = @{
            "Authorization" = "Bearer $($config.deployment.luarmor.apiKey)"
            "Content-Type" = "application/json"
        }

        $fileBytes = [System.IO.File]::ReadAllBytes($distPath)
        $fileBase64 = [System.Convert]::ToBase64String($fileBytes)

        $body = @{
            script = $fileBase64
            version = $version
        } | ConvertTo-Json

        $luarmorUrl = "https://api.luarmor.net/v3/projects/$($config.deployment.luarmor.projectId)/scripts/$($config.deployment.luarmor.scriptId)"
        $response = Invoke-RestMethod -Uri $luarmorUrl -Method Put -Headers $headers -Body $body

        Write-Host "[SUCCESS] Luarmor script updated to version $version"
        return $true
    }
    catch {
        Write-Host "[ERROR] Failed to update Luarmor script. Details:"
        Write-Host "Error Message: $($_.Exception.Message)"
        if ($_.Exception.Response) {
            Write-Host "Status Code: $($_.Exception.Response.StatusCode.value__)"
            Write-Host "Status Description: $($_.Exception.Response.StatusDescription)"
            $reader = New-Object System.IO.StreamReader($_.Exception.Response.GetResponseStream())
            $reader.BaseStream.Position = 0
            $reader.DiscardBufferedData()
            $responseBody = $reader.ReadToEnd()
            Write-Host "Response Body: $responseBody"
        }
        return $false
    }
}

Push-Marker "BUILD_TYPE" "GET BUILD_TYPE"
Push-Marker "BUILD_VERSION" "GET BUILD_VERSION"
Push-Marker "SPLIT" "GET BUILD"

$buildType     = BType-Input
$buildVersion  = if ($buildType -eq 'Release') { BVersion-Input } else { $null }

Write-Host "[PROCESSING] Bundling $buildType build..."

$tempDist = "$PSScriptRoot\dist.luau.tmp"
$splitMarker = $script:Markers["SPLIT"]

darklua process ../src/init.luau $tempDist -c .darklua.json > $null

Write-Host "[PROCESSING] Extracting splitter..."
$splitSegments = Extract -marker $splitMarker -splitFile "header.luau"

Write-Host "[PROCESSING] Composing output..."

$distContent = Get-Content $tempDist | ForEach-Object { "$($splitSegments[2])$_" }
$rawContent = @()
$rawContent += $splitSegments[0]
$rawContent += $distContent
$rawContent += $splitSegments[1]

$distribution = Rep-Markers $rawContent $buildType $buildVersion
$distribution | Set-Content ../dist.luau -Encoding UTF8

Remove-Item $tempDist -Force

Write-Host "[SUCCESS] Build complete! Output: ..\dist.luau"

if ($buildType -eq 'Release') {
    if (Release-Input) {
        $distPath = (Resolve-Path "..\dist.luau").Path
        $success = $true
        
        if (-not (Distribute-Github -version $buildVersion -distPath $distPath)) {
            Write-Host "`n[ERROR] Failed to distribute build to GitHub"
            $success = $false
        }
        
        if (-not (Distribute-Luarmor -version $buildVersion -distPath $distPath)) {
            Write-Host "`n[ERROR] Failed to distribute build to Luarmor"
            $success = $false
        }
        
        if ($success) {
            Write-Host "`n[SUCCESS] Build is now distributed to the public"
        }
    }
}

exit 0