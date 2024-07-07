Param([bool]$flag)
if (-not $flag) { exit 0 }

$tempdir = "$env:TEMP_DIR\php"


C:\PROGRA~1\7-Zip\7z.exe x U:\SiS\php\php-8.3.3-Win32-vs16-x64.zip -o"$($path)"

.\add_path $path

./php/Composer-Setup.exe /LOADINF="./php/composer.inf" /CURRENTUSER /SILENT
