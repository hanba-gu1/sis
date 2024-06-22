$jsonData = (Get-Content "U:\SiS\setting.json" | ConvertFrom-Json)
if(-not $jsonData.python.flag){ exit 0; }

.\Python\python-3.12.1-amd64.exe /passive PrependPath=1