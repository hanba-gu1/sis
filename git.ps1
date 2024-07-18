Param([bool]$flag, [string]$username, [string]$email, [bool]$sis_auto_update)
if(-not $flag){ exit 0 }

$tempdir = "$env:TEMP_DIR\git"

if (-not (Test-Path $tempdir)) {
    mkdir $tempdir
}

$script_move_path = "$tempdir\git-install.ps1"
Copy-Item .\git-install.ps1 $script_move_path

Start-Process powershell -Args "$script_move_path $tempdir $username $email" -Verb RunAs -Wait


Add-Type -AssemblyName System.Web

C:\PROGRA~1\Git\cmd\git.exe config --global user.name $username
C:\PROGRA~1\Git\cmd\git.exe config --global user.email $email

C:\PROGRA~1\Git\cmd\git.exe config --global http.proxy $env:http_proxy

C:\PROGRA~1\Git\cmd\git.exe config --global safe.directory *

if ($sis_auto_update) {
    C:\PROGRA~1\Git\cmd\git.exe pull
}
