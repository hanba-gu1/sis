$jsonData = (Get-Content "U:\SiS\setting.json" | ConvertFrom-Json)

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAl" /t REG_DWORD /d $jsonData.taskber.position /f
