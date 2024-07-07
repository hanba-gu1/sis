Param([string]$add_path)

$path = [System.Environment]::GetEnvironmentVariable("Path", "User").split(";")

if (-not ($path -contains $add_path)) {
    $path += $add_path
    $path = $path -join ";"
    
    $env:path = $path
    [System.Environment]::SetEnvironmentVariable("Path", $path, "User")
    [System.Environment]::GetEnvironmentVariable("Path", "User")
}
