Param([bool]$flag)
if(-not $flag){ exit 0 }

$tempdir = "$env:TEMP_DIR\git"

if (-not (Test-Path $tempdir)) {
    mkdir $tempdir
}

Start-Process powershell -Args "$env:SIS_ROOT\git-install.ps1 $tempdir" -Verb RunAs
