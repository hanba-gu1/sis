$jsonData = (Get-Content "U:\SiS\setting.json" | ConvertFrom-Json)
if(-not $jsonData.nodejs.flag){ exit 0; }

./nodejs/node-v20.11.1-x64.msi /passive