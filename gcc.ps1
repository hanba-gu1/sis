Param([bool]$flag)
if(-not $flag){ exit 0 }

$tempdir = "$env:TEMP_DIR\gcc"
$installer_link = "https://github.com/niXman/mingw-builds-binaries/releases/download/13.2.0-rt_v11-rev0/x86_64-13.2.0-release-win32-seh-msvcrt-rt_v11-rev0.7z"
$installer_path = "$tempdir\mingw64.7z"
$program_dir = "$tempdir\mingw64"
$bin_dir = "$program_dir\bin"

if (-not (Test-Path $tempdir)) {
    mkdir $tempdir
}

$ProgressPreference = 'SilentlyContinue'
Invoke-WebRequest $installer_link -OutFile $installer_path

Start-Process "$([System.Environment]::GetFolderPath("ProgramFiles"))\7-Zip\7z.exe" "x `"$installer_path`" -o`"$tempdir`""

.\add_path $bin_dir
