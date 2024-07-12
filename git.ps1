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

C:\PROGRA~1\Git\cmd\git.exe config --global safe.directory *

if ($sis_auto_update) {
    C:\PROGRA~1\Git\cmd\git.exe pull
}
