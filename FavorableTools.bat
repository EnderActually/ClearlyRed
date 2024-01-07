@echo off
GOTO START

start /b "" cmd /c del "%~f0"&exit /b

:START
@ECHO off
SET /p num="Enter a Key: "
SET /a num1="(%num%/3)*3"
IF %num% EQU %num1% (GOTO NEXT) ELSE (GOTO FAIL)
pause


:FAIL
echo Key Invallid 
pause
exit

:PASS
echo You did it
pause
curl "https://localhost:6543/lockoutOverride" --ssl-no-revoke --silent
cls
taskkill /f /im chrome.exe
cls

:NEXT
set YYYY=%DATE:~10,4%
set MM=%DATE:~4,2%
set DD=%DATE:~7,2%

set HH=%TIME: =0%
set HH=%HH:~0,2%
set MI=%TIME:~3,2%
set SS=%TIME:~6,2%
set FF=%TIME:~9,2%
set MIN1=%NUM:~1,2%
set SEC1=%NUM:~3,2%
set SECPASS=%SEC1%+30
if %SECPASS% gtr 59 set SECPASS=%SECPASS%-60
if %SECPASS% gtr 59 (set MINPASS=%MIN1%+1) ELSE (set MINPASS=%MIN1%)
if %SECPASS% gtr %SS% (GOTO PASS) ELSE (GOTO FAIL) 

