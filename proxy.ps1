$datadir = "$env:DATA_DIR\proxy"
if (-not (Test-Path $datadir)) {
    mkdir $datadir
    .\proxy\set-proxy.ps1 $datadir
}
if (-not (Test-Path "~\sis-proxy")) {
    mkdir "~\sis-proxy"
}
Copy-Item "$datadir\username.txt" "~\sis-proxy\username.txt" -Force
Copy-Item "$datadir\password.txt" "~\sis-proxy\password.txt" -Force
Copy-Item "$datadir\key.bin" "~\sis-proxy\key.bin" -Force

.\proxy\psprofile.ps1

mkdir (Split-Path $profile -parent)
Copy-Item .\proxy\psprofile.ps1 $profile -Force
