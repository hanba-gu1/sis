Param([bool]$flag, [string]$username, [string]$email)
if(-not $flag){ exit 0 }

$tempdir = "$env:TEMP_DIR\git"

if (-not (Test-Path $tempdir)) {
    mkdir $tempdir
}

$script_move_path = "$tempdir\git-install.ps1"
Copy-Item .\git-install.ps1 $script_move_path

Start-Process powershell -Args "$script_move_path $tempdir $username $email" -Verb RunAs
