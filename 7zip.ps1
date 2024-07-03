$install_link = "https://www.7-zip.org/a/7z2407-x64.exe"

$temp_dir = "$env:TEMP_DIR/7zip"
if (-not (Test-Path $temp_dir)) {
    mkdir $temp_dir
}

$ProgressPreference = 'SilentlyContinue'
Invoke-WebRequest $install_link -OutFile "$temp_dir/7zinstaller.exe"

Invoke-Expression "$temp_dir/7zinstaller.exe /S"
