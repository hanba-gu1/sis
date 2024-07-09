.\config.ps1
if (Test-Path .\local.ps1) {
    .\local.ps1
}

if (-not (Test-Path $env:TEMP_DIR)) {
    mkdir $env:TEMP_DIR
}
if (-not (Test-Path $env:DATA_DIR)) {
    mkdir $env:DATA_DIR
}

if (-not (Test-Path .\settings.json)) {
    Copy-Item .\settings.json.example .\settings.json
}

$jsonData = (Get-Content .\settings.json | ConvertFrom-Json)

# プロキシ設定
.\proxy.ps1 $jsonData.proxy.flag

# 7zipインストール
.\7zip.ps1

# タスクバー位置
.\taskbar.ps1 $jsonData.taskbar.flag

# デスクトップ変更
.\desktop.ps1 $jsonData.desktop.flag $jsonData.desktop.image_path

# VSCode設定
.\vscode.ps1 $jsonData.vscode.flag

# GoogleChrome設定
.\chrome.ps1 $jsonData.chrome.flag

# GCCインストール
.\gcc.ps1 $jsonData.gcc.flag

# Gitインストール
.\git.ps1 $jsonData.git.flag $jsonData git.username $jsonData.git.mail

# PHPインストール
.\php.ps1 $jsonData.php.flag

# # Pythonインストール
# .\python.ps1

# # Node.jsインストール
# .\nodejs.ps1
