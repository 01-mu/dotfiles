function ls { Get-ChildItem }

function ll { Get-ChildItem -Force -File | Format-Table Name, Length, LastWriteTime }
function la { Get-ChildItem -Force }
function grep { param($pattern); Select-String -Pattern $pattern }
function lg { Get-ChildItem -Force | Select-String $args }

if (Test-Path "$PWD\workspace") {
  Set-Location "$PWD\workspace"
}