Param([bool]$flag)
if (-not $flag) { exit 0 }

$tempdir = "$env:TEMP_DIR\python"
if (-not (Test-Path $tempdir)) {
    mkdir $tempdir
}

$installer_link = "https://www.python.org/ftp/python/3.12.4/python-3.12.4-amd64.exe"
$installer_path = "$tempdir\python-3.12.4-amd64.exe"

$ProgressPreference = 'SilentlyContinue'
Invoke-WebRequest $installer_link -OutFile $installer_path

Start-Process $installer_path -Args "/passive PrependPath=1"
