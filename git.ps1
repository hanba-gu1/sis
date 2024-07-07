Param([bool]$flag)
if(-not $flag){ exit 0 }

$tempdir = "$env:TEMP_DIR\git"

if (-not (Test-Path $tempdir)) {
    mkdir $tempdir
}

Start-Process powershell -Args "$env:SIS_ROOT\git-install.ps1 $tempdir" -Verb RunAs

# Start-Process powershell.exe "
# 	Set-Location $($git.installer_move_path)\WindowsInfrastructureExample\
# 	.\install-git.ps1
# 	.\set-git-path.ps1
# 	C:\PROGRA~1\Git\cmd\git.exe config --global user.name $($git.username)
# 	C:\PROGRA~1\Git\cmd\git.exe config --global user.email $($git.email)
# 	C:\PROGRA~1\Git\cmd\git.exe config --global http.proxy $env:http_proxy
# 	C:\PROGRA~1\Git\cmd\git.exe 
# " -Verb RunAs
