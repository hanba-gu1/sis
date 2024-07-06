Param([string]$flag)
if(-not $flag){ exit 0 }

$tempdir = "$env:TEMP_DIR\chrome"
$datadir = "$env:DATA_DIR\chrome"

$userdata_dir ="$datadir\user-data"
$cache_dir = "$tempdir\cache"

if (!(Test-Path $userdata_dir)) {
    mkdir $userdata_dir
}
if (!(Test-Path $cache_dir)) {
    mkdir    $cache_dir
}

$bin_paths= @(
    "$([System.Environment]::GetFolderPath("ProgramFiles"))\Google\Chrome\Application\chrome.exe",
    "$([System.Environment]::GetFolderPath("ProgramFilesx86"))\Google\Chrome\Application\chrome.exe"
)
$default_shortcut = "$([System.Environment]::GetFolderPath("Desktop"))\Google Chrome.lnk"
$shortcut_path = "$([System.Environment]::GetFolderPath("Desktop"))\SiS Google Chrome.lnk"

if(Test-Path $default_shortcut){
	Remove-item $default_shortcut
}

foreach ($bin_path in $bin_paths){
    if (Test-Path $bin_path){
        $wsh = New-Object -ComObject Wscript.Shell
        $sc = $wsh.CreateShortCut($shortcut_path)
        $sc.TargetPath = $bin_path
        $sc.Arguments = "--user-data-dir=$userdata_dir --disk-cache-dir=$cache_dir"
        $sc.save()
        break
    }
}
