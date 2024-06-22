$jsonData = (Get-Content "U:\SiS\setting.json" | ConvertFrom-Json)
if(-not $jsonData.php.flag){ exit 0; }
$path = $jsonData.php.path

New-Item $path -ItemType Directory

C:\PROGRA~1\7-Zip\7z.exe x U:\SiS\php\php-8.3.3-Win32-vs16-x64.zip -o"$($path)"

.\add_path $path

./php/Composer-Setup.exe /LOADINF="./php/composer.inf" /CURRENTUSER /SILENT