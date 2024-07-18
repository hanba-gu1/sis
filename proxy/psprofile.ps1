$username = Get-Content "~\sis-proxy\username.txt"
$encryptedPassword = Get-Content "~\sis-proxy\password.txt"
$key = Get-Content "~\sis-proxy\key.bin" -Encoding Byte

$securePassword = $encryptedPassword | ConvertTo-SecureString -Key $key
$bstr = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($securePassword)
$password = [System.Runtime.InteropServices.Marshal]::PtrToStringBSTR($bstr)
[System.Runtime.InteropServices.Marshal]::ZeroFreeBSTR($bstr)

Add-Type -AssemblyName System.Web

# 個別の認証情報
$proxyUser = $username
$proxyPassword = $password
$proxyhost = "10.1.100.111:8080"

# 環境変数
$proxyAddressWithAuthenticattion = "http://$($proxyUser):$([System.Web.HttpUtility]::UrlEncode($proxyPassword))@$($proxyhost)"
$env:http_proxy = $proxyAddressWithAuthenticattion
$env:https_proxy = $proxyAddressWithAuthenticattion
$env:ftp_proxy = $proxyAddressWithAuthenticattion

# クレデンシャル設定
$passwordSecure = ConvertTo-SecureString $proxyPassword -AsPlainText -Force
$creds = New-Object System.Management.Automation.PSCredential $proxyUser, $passwordSecure
$proxy = New-Object System.Net.WebProxy "http://$($proxyhost)/"
$proxy.Credentials = $creds
[System.Net.WebRequest]::DefaultWebProxy = $proxy
