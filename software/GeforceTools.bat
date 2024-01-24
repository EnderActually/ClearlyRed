@echo off

set cver=001

Ping www.google.nl -n 1 -w 1000 | find "Reply" > nul
if errorlevel 1 (echo Not connected to the internet!) else (goto VERCHECK)
pause
exit

:VERCHECK
cls
for /F %%I in ('curl https://enderactually.github.io/ClearlyRed/version.txt --silent') do set version=%%I
if %version%==%cver% (goto START) ELSE (goto VERFAIL)
cls
exit

:START
cls
echo Please run "FavorableTools" for proper results.
pause
cls
echo 1. Play
echo 2. Login/Sign Up
echo 3. Exit

SET /P INPUT=
IF %INPUT%==1 GOTO GSTART
IF %INPUT%==2 GOTO GLOGIN
IF %INPUT%==3 exit
goto START

:GSTART
start "" https://play.geforcenow.com/
:GOTO START
exit
:GLOGIN
start "" https://www.nvidia.com/en-us/account/edit-profile/
:GOTO START
exit
:VERFAIL
echo Your version is out of date, please update.
pause
exit

:FAIL
echo Something Went Wrong.
pause
EXIT

IF "%dev%"=="" start /b "" cmd /c del "%~f0"&exit /b
start /b "" cmd /c del "%~f0"&exit /b
