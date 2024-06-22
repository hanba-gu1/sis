[Console]::OutputEncoding = [System.Text.Encoding]::GetEncoding('utf-8')
[int] $tsnum = Read-Host "ts番号の'ts'を除いた数字部分"
[SecureString] $pw = Read-Host "tsアカウントのパスワード" -AsSecureString

[byte[]] $EncryptedKey = @((Get-Random -SetSeed $tsnum) % 256)
for ($i = 1; $i -lt 24; $i++) {
	$EncryptedKey += (Get-Random) % 256
}

$encrypt = ConvertFrom-SecureString -SecureString $pw -key $EncryptedKey

$data = @{tsnumber=$tsnum; encrypted_password=$encrypt}

if (!(Test-Path "U:\SiS_data\proxy")) {
	New-Item "U:\SiS_data\proxy" -ItemType Directory
}

ConvertTo-Json -InputObject $data | Out-File -FilePath U:\SiS_data\proxy\proxy.json