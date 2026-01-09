function ls { Get-ChildItem }

function ll { Get-ChildItem -Force -File | Format-Table Name, Length, LastWriteTime }
function la { Get-ChildItem -Force }
function grep { param($pattern); Select-String -Pattern $pattern }
function lg { Get-ChildItem -Force | Select-String $args }
function .. { Set-Location .. }
function ... { Set-Location ..\.. }

Set-Alias j z

if (Test-Path "$PWD\workspace") {
  Set-Location "$PWD\workspace"
}

# For zoxide v0.8.0+
Invoke-Expression (& {
    $hook = if ($PSVersionTable.PSVersion.Major -lt 6) { 'prompt' } else { 'pwd' }
    (zoxide init --hook $hook powershell | Out-String)
})