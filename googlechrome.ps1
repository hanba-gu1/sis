$jsonData = (Get-Content "U:\SiS\setting.json" | ConvertFrom-Json)
if(-not $jsonData.googlechrome.flag){ exit 0; }
$userdata_dir = $jsonData.googlechrome.datadir_path
$cache_dir = $jsonData.googlechrome.cachedir_path

if (!(Test-Path $userdata_dir)) {
	New-Item $userdata_dir -ItemType Directory
}

New-Item $cache_dir -ItemType Directory

$dirs= @(
	"C:\Program Files\Google\Chrome\Application\chrome.exe",
	"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
);

if(Test-Path "C:\Users\user\Desktop\Google Chrome.lnk"){
	Remove-item "C:\Users\user\Desktop\Google Chrome.lnk"
}
foreach ($dir in $dirs){
	if (Test-Path $dir){
		$wsh=New-Object -ComObject Wscript.Shell
		$sc=$wsh.CreateShortCut('C:\Users\user\Desktop\SiS Google Chrome.lnk')
		$sc.TargetPath=$dir
		$sc.Arguments="--user-data-dir=$userdata_dir\user-data --disk-cache-dir=$cache_dir\cache"
		$sc.save()
		break
	}
}