#v0.0.1
Param ( $local, $server )

Function VersionOf(){
    $line = java -cp $args[0] -D'java.awt.headless=true' io.github.kensuke1984.anisotime.About | Select-Object -First 1
    $version = ($line -split " ")[1]
    return $version
}

Function DownloadANISOtime(){
    Invoke-WebRequest https://bit.ly/2QUnqJr -OutFile $server
}

DownloadANISOtime
$local_version=VersionOf $local
$server_version=VersionOf $server

if ("$local_version" -lt "$server_version"){
    Rename-Item $local anisotime_$local_version.bat
    Move-Item $server $local
}else{
    Remove-Item $server
}

