@echo off
rem v0.0.4
rem copy /b anisotime_header.bat+anisotime.jar anisotime.bat
java -Xmx2g -cp "%~f0" io.github.kensuke1984.anisotime.ANISOtime %*
IF /I "%ERRORLEVEL%" EQU "55" (
    del %~df0
    ren %~dp0\latest_anisotime %~nx0
    echo ANISOtime is updated.
    exit /b 55
)
exit /b %ERRORLEVEL%
