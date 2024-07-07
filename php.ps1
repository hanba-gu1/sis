Param([bool]$flag)
if (-not $flag) { exit 0 }

$tempdir = "$env:TEMP_DIR\php"

if (-not (Test-Path $tempdir)) {
    mkdir $tempdir
}

$zip_link = "https://windows.php.net/downloads/releases/php-8.3.9-Win32-vs16-x64.zip"
$zip_path = "$tempdir\php-8.3.9-Win32-vs16-x64.zip"
$program_dir = "$tempdir\php"

$ProgressPreference = 'SilentlyContinue'
Invoke-WebRequest $zip_link -OutFile $zip_path

C:\PROGRA~1\7-Zip\7z.exe x $zip_path -o"$program_dir"

.\add_path $program_dir

$composer_installer_link = "https://getcomposer.org/Composer-Setup.exe"
$composer_installer_path = "$tempdir\Composer-Setup.exe"
$composer_program_dir = "$tempdir"
$composer_inf = "$env:SIS_ROOT\php\composer.inf"

Invoke-WebRequest $composer_installer_link -OutFile $composer_installer_path

Start-Process $composer_installer_path -Args "/LOADINF=`"$composer_inf`" /DIR=`"$composer_program_dir`" /DEV=`"$composer_program_dir`" /CURRENTUSER /SILENT /PHP=`"$program_dir\php.exe`""
