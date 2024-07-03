./config.ps1

if (-not (Test-Path $env:TEMP_DIR)) {
    mkdir $env:TEMP_DIR
}
if (-not (Test-Path $env:DATA_DIR)) {
    mkdir $env:DATA_DIR
}

# プロキシ設定
# .\proxy.ps1

# 7zipインストール
.\7zip.ps1

# # タスクバー位置
.\taskber.ps1

# # デスクトップ変更
# .\desktop.ps1

# # VSCode設定
# .\vscode.ps1

# # GoogleChrome設定
# .\googlechrome.ps1

# # GCCインストール
# .\gcc.ps1

# # Gitインストール
# .\git.ps1

# # PHPインストール
# .\php.ps1

# # Pythonインストール
# .\python.ps1

# # Node.jsインストール
# .\nodejs.ps1
