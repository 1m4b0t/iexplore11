@echo off
: Change code page to UTF8 in case you use unicode chars in strings
chcp 65001

: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )
:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "cmd.exe", "/C """"%~f0""""", , "runas", 1 >> "%temp%\getadmin.vbs"
    cscript "%temp%\getadmin.vbs"
    exit /B
:gotAdmin
    if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
    pushd "%CD%"
    CD /D "%~dp0"

rem --- FROM HERE PASTE YOUR ADMIN-ENABLED BATCH SCRIPT ---
mkdir C:\tempp
cd C:\tempp
curl -o "Internet Explorer.lnk" https://raw.githubusercontent.com/1m4b0t/iexplore11/main/ie
curl -o iexplore.vbs https://raw.githubusercontent.com/1m4b0t/iexplore11/main/iexplore.vbs
copy iexplore.vbs "C:\Program Files\Internet Explorer"
copy "Internet Explorer.lnk" %homepath%\Desktop
copy "Internet Explorer.lnk" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs"
cd ..
del /f /s /q tempp
rmdir tempp
rem --- END OF BATCH ----





