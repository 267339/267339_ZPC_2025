# Script: scripts\theme-setup.ps1
# Purpose: Install theme node dependencies and run Hugo server with theme's node_modules\.bin on PATH
# Usage: Run from project root: pwsh -File .\scripts\theme-setup.ps1

$ErrorActionPreference = 'Stop'

# Resolve script and project paths safely
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$siteRoot = Resolve-Path -Path (Join-Path $scriptDir '..') | Select-Object -ExpandProperty Path
$themeDir = Join-Path $siteRoot 'themes\seven-main'

Write-Host "Site root: $siteRoot"
Write-Host "Theme dir: $themeDir"

# 1) Check Node and npm availability
function Find-Executable($name, [string[]]$candidates) {
    $cmd = Get-Command $name -ErrorAction SilentlyContinue
    if ($cmd) { return $cmd.Source }
    foreach ($c in $candidates) {
        if (Test-Path $c) { return $c }
    }
    return $null
}

# Look for node and npm in PATH first, then in common install locations
$nodeCmd = Find-Executable 'node' @('C:\Program Files\nodejs\node.exe','C:\Program Files (x86)\nodejs\node.exe')
$npmCmd = Find-Executable 'npm' @('C:\Program Files\nodejs\npm.cmd','C:\Program Files\nodejs\npm.ps1','C:\Program Files (x86)\nodejs\npm.cmd')

if (-not $nodeCmd) {
    Write-Host 'Node not found in PATH or common locations. Please install Node.js (https://nodejs.org/) and try again.' -ForegroundColor Red
    exit 1
}
if (-not $npmCmd) {
    Write-Host 'npm not found in PATH or common locations. Please install Node.js (which includes npm) and try again.' -ForegroundColor Red
    exit 1
}

$nodeVer = (& $nodeCmd -v) 2>$null
$npmVer = (& $npmCmd -v) 2>$null
Write-Host "Node: $nodeVer, npm: $npmVer"

# Ensure the Node installation directory is on PATH so child processes (like postcss) can find node
$nodeDir = Split-Path -Parent $nodeCmd
if ($nodeDir -and ($env:PATH -notlike "*$nodeDir*")) {
    Write-Host "Adding Node install folder to PATH: $nodeDir"
    $env:PATH = $nodeDir + ';' + $env:PATH
}

# 2) Install theme deps if package.json exists
$pkgPath = Join-Path $themeDir 'package.json'
if (-not (Test-Path $pkgPath)) {
    Write-Host "No package.json found in $themeDir. Skipping npm install." -ForegroundColor Yellow
} else {
    Push-Location $themeDir
    try {
        if (Test-Path 'package-lock.json') {
            Write-Host 'package-lock.json found - running npm ci for a clean install...'
            & $npmCmd ci
        } else {
            Write-Host 'Running npm install in theme directory...'
            & $npmCmd install
        }
    } catch {
        Write-Host 'npm install failed. See npm output above for details.' -ForegroundColor Red
        Pop-Location
        exit 1
    }
    Pop-Location
}

# 3) Add theme node_modules\.bin to PATH for this session
$binPath = Join-Path $themeDir 'node_modules\.bin'
if (Test-Path $binPath) {
    Write-Host "Adding $binPath to PATH for this session..."
    $env:PATH = $binPath + ';' + $env:PATH
} else {
    Write-Host "Warning: $binPath not found - PostCSS binary may still be unavailable." -ForegroundColor Yellow
}

# 4) Run Hugo server from site root
Push-Location $siteRoot
Write-Host 'Starting Hugo server (Ctrl-C to stop)...' -ForegroundColor Green
try {
    hugo server -D
} finally {
    Pop-Location
}
