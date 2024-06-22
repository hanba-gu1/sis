$jsonData = (Get-Content "U:\SiS\setting.json" | ConvertFrom-Json)
$git = $jsonData.git
if(-not $git.flag){
	exit 0
}

New-Item $git.installer_move_path -ItemType Directory

$FromPath = "U:\SiS\Git\WindowsInfrastructureExample"
if (!(Test-Path "$($git.installer_move_path)\WindowsInfrastructureExample")) {
	Copy-Item -Recurse $FromPath "$($git.installer_move_path)\WindowsInfrastructureExample"
}

Start-Process powershell.exe "
	Set-Location $($git.installer_move_path)\WindowsInfrastructureExample\
	.\install-git.ps1
	.\set-git-path.ps1
	C:\PROGRA~1\Git\cmd\git.exe config --global user.name $($git.username)
	C:\PROGRA~1\Git\cmd\git.exe config --global user.email $($git.email)
	C:\PROGRA~1\Git\cmd\git.exe config --global http.proxy $env:http_proxy
	C:\PROGRA~1\Git\cmd\git.exe 
" -Verb RunAs