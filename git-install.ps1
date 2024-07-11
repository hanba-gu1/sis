Param([string]$tempdir, [string]$username, [string]$email)

$zip_link = "https://codeload.github.com/tsgcpp/WindowsInfrastructureExample/zip/refs/heads/main"
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

Add-Type -AssemblyName System.Web

C:\PROGRA~1\Git\cmd\git.exe config --global user.name $username
C:\PROGRA~1\Git\cmd\git.exe config --global user.email $email

Add-Type -AssemblyName System.Web

$proxyUser = Get-Content "~\sis-proxy\username.txt"
$encryptedPassword = Get-Content "~\sis-proxy\password.txt"
$key = Get-Content "~\sis-proxy\key.bin" -Encoding Byte

$securePassword = $encryptedPassword | ConvertTo-SecureString -Key $key
$bstr = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($securePassword)
$proxyPassword = [System.Runtime.InteropServices.Marshal]::PtrToStringBSTR($bstr)
[System.Runtime.InteropServices.Marshal]::ZeroFreeBSTR($bstr)

$proxy = "http://$($proxyUser):$([System.Web.HttpUtility]::UrlEncode($proxyPassword))@10.1.100.111:8080"

C:\PROGRA~1\Git\cmd\git.exe config --global http.proxy $proxy
