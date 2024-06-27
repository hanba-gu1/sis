U:
Set-Location U:\SiS
mkdir "C:\Users\user\Downloads\sis_temp"
mkdir "U:\SiS_data"

# powershell実行ポリシー変更
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force

# プロキシ設定
.\proxy.ps1

# 7zipインストール
.\7zip.ps1

# タスクバー位置
.\taskber.ps1

# デスクトップ変更
.\desktop.ps1

# VSCode設定
.\vscode.ps1

# GoogleChrome設定
.\googlechrome.ps1

# GCCインストール
.\gcc.ps1

# Gitインストール
.\git.ps1

# PHPインストール
.\php.ps1

# Pythonインストール
.\python.ps1

# Node.jsインストール
.\nodejs.ps1
