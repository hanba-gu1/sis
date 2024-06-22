$jsonData = (Get-Content "U:\SiS\setting.json" | ConvertFrom-Json)
$proxy = $jsonData.proxy

if(!$proxy.flag) { exit 0 }

New-Item $proxy.setting_path -ItemType Directory
Copy-Item U:\SiS_data\proxy\proxy.json $proxy.setting_path -Force

New-Item (Split-Path $profile -parent) -ItemType Directory
Copy-Item U:\SiS\proxy\psprofile.ps1 $profile -Force

./proxy/psprofile.ps1
