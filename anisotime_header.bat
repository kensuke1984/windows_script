@echo off
rem v0.0.3
rem copy /b anisotime_header.bat+anisotime.jar anisotime.bat
java -Xmx2g -cp "%~f0" io.github.kensuke1984.anisotime.ANISOtime %*
powershell -Command "Invoke-WebRequest https://bit.ly/2MeFZV8 -OutFile %tmp%\check_version.ps1"
start Powershell.exe -windowstyle hidden -executionpolicy remotesigned -File %tmp%\check_version.ps1 %0 %tmp%\anisotime.bat.tmp
exit /b %ERRORLEVEL%
