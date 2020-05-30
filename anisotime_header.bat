@echo off
rem v0.0.2
rem copy /b anisotime_header.bat+anisotime.jar anisotime.bat
java -Xmx2g -cp "%~f0" io.github.kensuke1984.anisotime.ANISOtime %*
start Powershell.exe -windowstyle hidden -executionpolicy remotesigned -File check_version.ps1 %0 %tmp%\anisotime.bat.tmp
exit /b %ERRORLEVEL%
