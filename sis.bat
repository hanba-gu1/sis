@REM powershell実行ポリシー変更
powershell Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force

cd %~dp0

powershell .\sis.ps1
