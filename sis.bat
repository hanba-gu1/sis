U:
cd U:\SiS
md "C:\Users\user\Downloads\sis_temp"
md "U:\SiS_data"

@REM powershell実行ポリシー変更
powershell Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force

@REM プロキシ設定
powershell .\proxy.ps1

@REM 7zipインストール
powershell .\7zip.ps1

@REM タスクバー位置
powershell .\taskber.ps1

@REM デスクトップ変更
powershell .\desktop.ps1

@REM VSCode設定
powershell .\vscode.ps1

@REM GoogleChrome設定
powershell .\googlechrome.ps1

@REM GCCインストール
powershell .\gcc.ps1

@REM Gitインストール
powershell .\git.ps1

@REM PHPインストール
powershell .\php.ps1

@REM Pythonインストール
powershell .\python.ps1

@REM Node.jsインストール
powershell .\nodejs.ps1

@REM Rustインストール
powershell .\rust.ps1