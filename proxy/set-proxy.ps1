Param([string]$datadir)

$key_path = "$datadir\key.bin"
$username_path = "$datadir\username.txt"
$password_path = "$datadir\password.txt"

$key = New-Object Byte[] 24
[Security.Cryptography.RNGCryptoServiceProvider]::Create().GetBytes($key)
[System.IO.File]::WriteAllBytes($key_path, $key);

$username = Read-Host "username(t + MS account number)"
$securePassword = Read-Host -AsSecureString "password"

$username | Out-File $username_path

$securePassword | ConvertFrom-SecureString -Key $key | Set-Content -Path $password_path
