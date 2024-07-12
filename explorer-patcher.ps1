Param([bool]$flag)
if (-not $flag) { exit 0 }

$tempdir = "$env:TEMP_DIR\explorer-patcher"
$datadir = "$env:DATA_DIR\explorer-patcher"
if (-not (Test-Path $tempdir)) {
    mkdir $tempdir
}
if (-not (Test-Path $datadir)) {
    mkdir $datadir
}

$reg_path = "$datadir\ExplorerPatcher.reg"
$installer_link = "https://github.com/valinet/ExplorerPatcher/releases/latest/download/ep_setup.exe"
$installer_path = "$tempdir\ep_setup.exe"

if (-not (Test-Path $reg_path)) {
    Copy-Item .\explorer-patcher\ExplorerPatcher.reg $reg_path
}

regedit /S $reg_path

$ProgressPreference = 'SilentlyContinue'
Invoke-WebRequest $installer_link -OutFile $installer_path

Start-Process $installer_path -Args "/passive PrependPath=1"
