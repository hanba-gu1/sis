$jsonData = (Get-Content "U:\SiS\setting.json" | ConvertFrom-Json)
if(-not $jsonData.vscode.flag){ exit 0 }
$vscode = $jsonData.vscode

if (!(Test-Path $vscode.datadir_path)) {
	New-Item $vscode.datadir_path -ItemType Directory
}

if($vscode.auto_install) {
	New-Item $vscode.installer_path -ItemType Directory
	$ProgressPreference = 'SilentlyContinue'
	Invoke-WebRequest "https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user" -OutFile "$($vscode.installer_path)/vscode-installer.exe"

	Invoke-Expression "$($vscode.installer_path)/vscode-installer.exe /SILENT /MERGETASKS=!runcode"
}

$wsh=New-Object -ComObject Wscript.Shell
$sc=$wsh.CreateShortCut("C:\Users\user\Desktop\SiS VSCode.lnk")
if($vscode.auto_install) {
	$sc.TargetPath="C:\Users\user\AppData\Local\Programs\Microsoft VS Code\bin\code.cmd"
}
else {
	$sc.TargetPath="C:\Program Files\Microsoft VS Code\bin\code.cmd"
}
$sc.Arguments="--lang ja --extensions-dir $($vscode.datadir_path)\extensions --user-data-dir $($vscode.datadir_path)\user-data"
$sc.IconLocation = "C:\Program Files\Microsoft VS Code\Code.exe"
$sc.save()