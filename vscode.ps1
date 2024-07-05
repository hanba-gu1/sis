Param([bool]$flag)
if (-not $flag) { exit 0 }

$tempdir = "$env:TEMP_DIR\vscode"
$datadir = "$env:DATA_DIR\vscode"

if (!(Test-Path $tempdir)) {
	New-Item $tempdir -ItemType Directory
}
if (!(Test-Path $datadir)) {
	New-Item $datadir -ItemType Directory
}

Start-Process powershell -Args ".\vscode-install.ps1 $tempdir $datadir"
