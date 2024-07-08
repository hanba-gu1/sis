$proxyUser = Read-Host "t + MS account number"
$proxyPassword = Read-Host "password"
$proxyhost = "10.1.100.111:8080"
$http_proxy = "http://$($proxyUser):$($proxyPassword)@$($proxyhost)"

[System.Environment]::SetEnvironmentVariable("http_proxy", $http_proxy, "User")
$env:http_proxy = $http_proxy

.\proxy\psprofile.ps1

mkdir (Split-Path $profile -parent)
Copy-Item U:\SiS\proxy\psprofile.ps1 $profile -Force