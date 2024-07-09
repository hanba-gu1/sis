Param([bool]$flag)
if (-not $flag) { exit 0 }

$tempdir = "$env:TEMP_DIR\nodejs"
if (-not (Test-Path $tempdir)) {
    mkdir $tempdir
}

$installer_link = "https://nodejs.org/dist/v20.15.1/node-v20.15.1-x64.msi"
$installer_path = "$tempdir\node-v20.15.1-x64.msi"

$ProgressPreference = 'SilentlyContinue'
Invoke-WebRequest $installer_link -OutFile $installer_path

Start-Process $installer_path -Args "/passive"
