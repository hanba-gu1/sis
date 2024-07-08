$proxyhost = "10.1.100.111:8080"

# 環境変数
$proxyAddressWithAuthenticattion = $env:http_proxy
$env:http_proxy = $proxyAddressWithAuthenticattion
$env:https_proxy = $proxyAddressWithAuthenticattion
$env:ftp_proxy = $proxyAddressWithAuthenticattion

# クレデンシャル設定
$passwordSecure = ConvertTo-SecureString $proxyPassword -AsPlainText -Force
$creds = New-Object System.Management.Automation.PSCredential $proxyUser, $passwordSecure
$proxy = New-Object System.Net.WebProxy "http://$($proxyhost)/"
$proxy.Credentials = $creds
[System.Net.WebRequest]::DefaultWebProxy = $proxy