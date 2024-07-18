Param([bool]$flag)
if (-not $flag) { exit 0 }

$datadir = "$env:DATA_DIR\proxy"
if (-not (Test-Path $datadir)) {
    mkdir $datadir
    .\proxy\set-proxy.ps1 $datadir
}
if (-not (Test-Path "~\sis-proxy")) {
    mkdir "~\sis-proxy"
}
Copy-Item "$datadir\username.txt" "~\sis-proxy\username.txt" -Force
Copy-Item "$datadir\password.txt" "~\sis-proxy\password.txt" -Force
Copy-Item "$datadir\key.bin" "~\sis-proxy\key.bin" -Force

$username = Get-Content "~\sis-proxy\username.txt"
$encryptedPassword = Get-Content "~\sis-proxy\password.txt"
$key = Get-Content "~\sis-proxy\key.bin" -Encoding Byte

$securePassword = $encryptedPassword | ConvertTo-SecureString -Key $key
$bstr = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($securePassword)
$password = [System.Runtime.InteropServices.Marshal]::PtrToStringBSTR($bstr)
[System.Runtime.InteropServices.Marshal]::ZeroFreeBSTR($bstr)

Add-Type -AssemblyName System.Web

$proxyUser = $username
$proxyPassword = $password
$proxyhost = "10.1.100.111:8080"

$proxyAddressWithAuthenticattion = "http://$($proxyUser):$([System.Web.HttpUtility]::UrlEncode($proxyPassword))@$($proxyhost)"
[System.Environment]::SetEnvironmentVariable("http_proxy", $proxyAddressWithAuthenticattion, "User")
[System.Environment]::SetEnvironmentVariable("https_proxy", $proxyAddressWithAuthenticattion, "User")
[System.Environment]::SetEnvironmentVariable("ftp_proxy", $proxyAddressWithAuthenticattion, "User")

.\proxy\psprofile.ps1

mkdir (Split-Path $profile -parent)
Copy-Item .\proxy\psprofile.ps1 $profile -Force
