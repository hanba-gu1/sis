$jsonData = (Get-Content "U:\SiS\setting.json" | ConvertFrom-Json)
$installer_path = $jsonData.szip.installer_path

New-Item $installer_path -ItemType Directory

$ProgressPreference = 'SilentlyContinue'
Invoke-WebRequest "https://www.7-zip.org/a/7z2407-x64.exe" -OutFile $installer_path/7z2301-x64.exe

Invoke-Expression "$installer_path/7z2301-x64.exe /S"

.\add_path.ps1 "C:\Program Files\7-Zip"