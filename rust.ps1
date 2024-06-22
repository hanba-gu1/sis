$jsonData = (Get-Content "U:\SiS\setting.json" | ConvertFrom-Json)
if(-not $jsonData.rust.flag){ exit 0; }

./Rust/rustup-init.exe -y