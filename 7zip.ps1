$jsonData = (Get-Content "U:\SiS\setting.json" | ConvertFrom-Json)
$installer_move_path = $jsonData.szip.installer_move_path

New-Item $installer_move_path -ItemType Directory

Copy-Item -Path .\7zip\7z2301-x64.exe -Destination $installer_move_path/7z2301-x64.exe
Invoke-Expression "$installer_move_path/7z2301-x64.exe /S"

.\add_path.ps1 "C:\Program Files\7-Zip"