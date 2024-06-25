$jsonData = (Get-Content "U:\SiS\setting.json" | ConvertFrom-Json)
if(-not $jsonData.gcc.flag){ exit 0; }
$compiler_path = $jsonData.gcc.compiler_path

New-Item $compiler_path -ItemType Directory
$ProgressPreference = 'SilentlyContinue'
Invoke-WebRequest "https://github.com/niXman/mingw-builds-binaries/releases/download/13.2.0-rt_v11-rev0/x86_64-13.2.0-release-win32-seh-msvcrt-rt_v11-rev0.7z" -OutFile "$compiler_path\mingw64.7z"

Start-Process "C:\Program Files\7-Zip\7z.exe" "x `"$compiler_path\mingw64.7z`" -o`"$($compiler_path)`""

.\add_path "$($compiler_path)\mingw64\bin"
