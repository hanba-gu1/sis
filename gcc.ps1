$jsonData = (Get-Content "U:\SiS\setting.json" | ConvertFrom-Json)
if(-not $jsonData.gcc.flag){ exit 0; }
$compiler_path = $jsonData.gcc.compiler_path

New-Item $compiler_path -ItemType Directory

Start-Process "C:\Program Files\7-Zip\7z.exe" "x `"U:\SiS\GCC\mingw64.7z`" -o`"$($compiler_path)`""

.\add_path "$($compiler_path)\mingw64\bin"