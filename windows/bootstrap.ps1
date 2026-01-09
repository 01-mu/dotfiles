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
$AppsScoop = @(
  "winmerge",
  "slack",
  "zoom",
  "obsidian",
  "googlechrome",
  "sakuraeditor",
  "vscode"
)
$AppsChoco = @(
  "a5m2"
)

function Ensure-Directory([string]$Path) {
  if (-not (Test-Path $Path)) {
    New-Item -ItemType Directory -Path $Path | Out-Null
  }
}

Write-Host "[1/6] Install package managers (prefer scoop)"
if (-not (Get-Command scoop -ErrorAction SilentlyContinue)) {
  Set-ExecutionPolicy -Scope CurrentUser RemoteSigned -Force
  Invoke-RestMethod -Uri "https://get.scoop.sh" | Invoke-Expression
}
if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
  Set-ExecutionPolicy -Scope CurrentUser Bypass -Force
  Invoke-Expression ((New-Object System.Net.WebClient).DownloadString("https://community.chocolatey.org/install.ps1"))
}

Write-Host "[2/6] Install apps (scoop preferred)"
if (Get-Command scoop -ErrorAction SilentlyContinue) {
  scoop bucket add extras
  foreach ($app in $AppsScoop) {
    scoop install $app
  }
}
if (Get-Command choco -ErrorAction SilentlyContinue) {
  foreach ($app in $AppsChoco) {
    choco install $app -y
  }
}

Write-Host "[3/6] Place .bat files on Desktop"
if (Test-Path $DesktopSource) {
  Ensure-Directory $DesktopTarget
  Copy-Item -Path (Join-Path $DesktopSource "*.bat") -Destination $DesktopTarget -Force
} else {
  Write-Host "skip: desktop source not found: $DesktopSource"
}

Write-Host "[4/6] Create C:\runshortcut and add to PATH"
Ensure-Directory $RunShortcutDir
$UserPath = [Environment]::GetEnvironmentVariable("Path", "User")
if (-not $UserPath) { $UserPath = "" }
if ($UserPath -notmatch [Regex]::Escape($RunShortcutDir)) {
  $NewUserPath = ($UserPath.TrimEnd(";") + ";" + $RunShortcutDir).TrimStart(";")
  [Environment]::SetEnvironmentVariable("Path", $NewUserPath, "User")
  $env:Path = $NewUserPath + ";" + $env:Path
}

Write-Host "[5/6] Install PowerShell profile"
if (Test-Path $ProfileSource) {
  Ensure-Directory (Split-Path $ProfileTarget -Parent)
  Copy-Item -Path $ProfileSource -Destination $ProfileTarget -Force
} else {
  Write-Host "skip: profile source not found: $ProfileSource"
}

Write-Host "[6/6] Install .wslconfig"
if (Test-Path $WslConfigSource) {
  Copy-Item -Path $WslConfigSource -Destination $WslConfigTarget -Force
} else {
  Write-Host "skip: wsl config not found: $WslConfigSource"
}

Write-Host "[7/7] Install VS Code settings"
if (Test-Path $VscodeSource) {
  Ensure-Directory (Split-Path $VscodeTarget -Parent)
  Copy-Item -Path $VscodeSource -Destination $VscodeTarget -Force
} else {
  Write-Host "skip: vscode settings not found: $VscodeSource"
}

Write-Host "Windows bootstrap complete."

Write-Host "Next steps (WSL2 + Ubuntu):"
Write-Host "  wsl --install -d Ubuntu"
Write-Host "  wsl --set-default-version 2"
Write-Host "  wsl --update"
Write-Host "Docker on Ubuntu:"
Write-Host "  sudo apt-get update"
Write-Host "  sudo apt-get install -y ca-certificates curl gnupg"
Write-Host "  sudo install -m 0755 -d /etc/apt/keyrings"
Write-Host "  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg"
Write-Host "  echo \"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo $VERSION_CODENAME) stable\" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null"
Write-Host "  sudo apt-get update"
Write-Host "  sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin"
Write-Host "  sudo usermod -aG docker $USER"
Write-Host "  newgrp docker"
