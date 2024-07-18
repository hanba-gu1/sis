Param([string]$tempdir)

$installer_link = "https://win.rustup.rs/x86_64"
$installer_path = "$tempdir\rustup-init.exe"

$ProgressPreference = 'SilentlyContinue'
Invoke-WebRequest $installer_link -OutFile $installer_path

& $installer_path -y
C:\Users\user\.cargo\bin\rustup.exe -Args "install nightly-x86_64-pc-windows-gnu" -Wait
C:\Users\user\.cargo\bin\rustup.exe -Args "default nightly-x86_64-pc-windows-gnu" -Wait
