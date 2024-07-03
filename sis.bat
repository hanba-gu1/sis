@REM powershell実行ポリシー変更
powershell Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force

powershell .\sis.ps1
