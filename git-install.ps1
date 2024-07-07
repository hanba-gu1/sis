Param([string]$tempdir, [string]$username, [string]$mail)

$zip_link = "https://github.com/tsgcpp/WindowsInfrastructureExample/archive/refs/heads/main.zip"
$zip_path = "$tempdir\installer.zip"

$ProgressPreference = 'SilentlyContinue'
Invoke-WebRequest $zip_link -OutFile $zip_path

C:\PROGRA~1\7-Zip\7z.exe x $zip_path -o"$tempdir"

$installer_dir = "$tempdir\WindowsInfrastructureExample-main"
$exe_link = "https://github.com/git-for-windows/git/releases/download/v2.36.1.windows.1/Git-2.36.1-64-bit.exe"

Set-Location $installer_dir
Invoke-WebRequest $exe_link -OutFile Git-2.36.1-64-bit.exe
.\install-git.ps1
.\set-git-path.ps1

C:\PROGRA~1\Git\cmd\git.exe config --global user.name $username
C:\PROGRA~1\Git\cmd\git.exe config --global user.mail $mail
