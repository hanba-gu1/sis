$proxy = (Get-Content "C:/Users/user/Downloads/sis_temp/proxy/proxy.json" | ConvertFrom-Json)

[byte[]] $EncryptedKey = @((Get-Random -SetSeed $proxy.tsnumber) % 256)
for ($i = 1; $i -lt 24; $i++) {
	$EncryptedKey += (Get-Random) % 256
}
$SecureString = (ConvertTo-SecureString -key $EncryptedKey -String ($proxy.encrypted_password))
$bstr = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($SecureString)
$StringPassword = [System.Runtime.InteropServices.Marshal]::PtrToStringBSTR($bstr)

# 個別の認証情報
$proxyUser = "ts" + $proxy.tsnumber
$proxyPassword = $StringPassword
$proxyhost = "10.1.100.111:8080"

# 環境変数
$proxyAddressWithAuthenticattion = "http://$($proxyUser):$($proxyPassword)@$($proxyhost)"
$env:http_proxy = $proxyAddressWithAuthenticattion
$env:https_proxy = $proxyAddressWithAuthenticattion
$env:ftp_proxy = $proxyAddressWithAuthenticattion

# クレデンシャル設定
$passwordSecure = ConvertTo-SecureString $proxyPassword -AsPlainText -Force
$creds = New-Object System.Management.Automation.PSCredential $proxyUser, $passwordSecure
$proxy = New-Object System.Net.WebProxy "http://$($proxyhost)/"
$proxy.Credentials = $creds
[System.Net.WebRequest]::DefaultWebProxy = $proxy