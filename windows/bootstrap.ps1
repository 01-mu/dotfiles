Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$RepoRoot = Resolve-Path (Join-Path $PSScriptRoot "..")
$DesktopSource = Join-Path $RepoRoot "windows\desktop"
$DesktopTarget = [Environment]::GetFolderPath("Desktop")
$RunShortcutDir = "C:\runshortcut"
$ProfileSource = Join-Path $RepoRoot "windows\powershell\Microsoft.PowerShell_profile.ps1"
$ProfileTarget = Join-Path $HOME "Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
$WslConfigSource = Join-Path $RepoRoot "windows\wsl\.wslconfig"
$WslConfigTarget = Join-Path $HOME ".wslconfig"
$VscodeSource = Join-Path $RepoRoot "windows\vscode\settings.json"
$VscodeTarget = Join-Path $env:APPDATA "Code\User\settings.json"

function Ensure-Directory([string]$Path) {
  if (-not (Test-Path $Path)) {
    New-Item -ItemType Directory -Path $Path | Out-Null
  }
}

Write-Host "[1/4] Place .bat files on Desktop"
if (Test-Path $DesktopSource) {
  Ensure-Directory $DesktopTarget
  Copy-Item -Path (Join-Path $DesktopSource "*.bat") -Destination $DesktopTarget -Force
} else {
  Write-Host "skip: desktop source not found: $DesktopSource"
}

Write-Host "[2/4] Create C:\runshortcut and add to PATH"
Ensure-Directory $RunShortcutDir
$UserPath = [Environment]::GetEnvironmentVariable("Path", "User")
if (-not $UserPath) { $UserPath = "" }
if ($UserPath -notmatch [Regex]::Escape($RunShortcutDir)) {
  $NewUserPath = ($UserPath.TrimEnd(";") + ";" + $RunShortcutDir).TrimStart(";")
  [Environment]::SetEnvironmentVariable("Path", $NewUserPath, "User")
  $env:Path = $NewUserPath + ";" + $env:Path
}

Write-Host "[3/4] Install PowerShell profile"
if (Test-Path $ProfileSource) {
  Ensure-Directory (Split-Path $ProfileTarget -Parent)
  Copy-Item -Path $ProfileSource -Destination $ProfileTarget -Force
} else {
  Write-Host "skip: profile source not found: $ProfileSource"
}

Write-Host "[4/4] Install .wslconfig"
if (Test-Path $WslConfigSource) {
  Copy-Item -Path $WslConfigSource -Destination $WslConfigTarget -Force
} else {
  Write-Host "skip: wsl config not found: $WslConfigSource"
}

Write-Host "[5/5] Install VS Code settings"
if (Test-Path $VscodeSource) {
  Ensure-Directory (Split-Path $VscodeTarget -Parent)
  Copy-Item -Path $VscodeSource -Destination $VscodeTarget -Force
} else {
  Write-Host "skip: vscode settings not found: $VscodeSource"
}

Write-Host "Windows bootstrap complete."
