Param([string]$tempdir, [string]$datadir)

$installer_link = "https://update.code.visualstudio.com/latest/win32-x64/stable"
$installer_path = "$tempdir/vscode-installer.exe"

$ProgressPreference = 'SilentlyContinue'
Write-Output "Downloading VSCode installer..."
Invoke-WebRequest $installer_link -OutFile $installer_path

$program_dir = "$tempdir\program"

Write-Output "installing VSCode..."
Start-Process $installer_path -Args "/SILENT /MERGETASKS=!runcode /Dir=$program_dir" -Wait

$shortcut_path = "$([System.Environment]::GetFolderPath("Desktop"))\SiS VSCode.lnk"
$bin_path = "$program_dir\bin\code.cmd"
$extensions_dir = "$datadir\extensions"
$userdata_dir = "$datadir\user-data"

if (-not (Test-Path $shortcut_path)) {
    Remove-Item $shortcut_path
}

$wsh = New-Object -ComObject Wscript.Shell
$sc = $wsh.CreateShortCut($shortcut_path)
$sc.TargetPath = $bin_path
$sc.Arguments = "--extensions-dir $extensions_dir --user-data-dir $userdata_dir"
$sc.IconLocation = "$program_dir\Code.exe"
$sc.save()

