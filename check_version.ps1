#v0.0.2
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
    $dirname=(Get-Item $local).DirectoryName
    $newname= $dirname+"\anisotime.bat"
    Remove-Item $local
    if (Test-Path $newname){
        Remove-Item $newname
    }
    Move-Item $server $newname
    $popup=New-Object -ComObject wscript.shell
    $popup.popup("ANISOtime is updated.",5,"",0)
}
else{
    Remove-Item $server
}
