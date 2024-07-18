Param([bool]$flag)
if (-not $flag) { exit 0 }

$tempdir = "$env:TEMP_DIR\rust"
if (-not (Test-Path $tempdir)) {
    mkdir $tempdir
}

Start-Process powershell -Args ".\rust-install.ps1 $tempdir"
