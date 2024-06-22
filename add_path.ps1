$path = [System.Environment]::GetEnvironmentVariable("Path", "User")
$path += ";$($args[0])"

$env:path = $path
[System.Environment]::SetEnvironmentVariable("Path", $path, "User")
[System.Environment]::GetEnvironmentVariable("Path", "User")