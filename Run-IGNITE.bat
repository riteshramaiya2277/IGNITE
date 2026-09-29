@echo off
title IGNITE — ASP.NET Web Server
cls
echo =====================================================================
echo                     IGNITE Web Application Runner
echo =====================================================================
echo.

set "IISEXPRESS="

REM Check standard 64-bit and 32-bit Program Files on C:
if exist "C:\Program Files\IIS Express\iisexpress.exe" set "IISEXPRESS=C:\Program Files\IIS Express\iisexpress.exe"
if "%IISEXPRESS%"=="" if exist "C:\Program Files (x86)\IIS Express\iisexpress.exe" set "IISEXPRESS=C:\Program Files (x86)\IIS Express\iisexpress.exe"

REM Check E: drive (since workspace is on E:)
if "%IISEXPRESS%"=="" if exist "E:\Program Files\IIS Express\iisexpress.exe" set "IISEXPRESS=E:\Program Files\IIS Express\iisexpress.exe"
if "%IISEXPRESS%"=="" if exist "E:\Program Files (x86)\IIS Express\iisexpress.exe" set "IISEXPRESS=E:\Program Files (x86)\IIS Express\iisexpress.exe"

REM Check D: drive
if "%IISEXPRESS%"=="" if exist "D:\Program Files\IIS Express\iisexpress.exe" set "IISEXPRESS=D:\Program Files\IIS Express\iisexpress.exe"
if "%IISEXPRESS%"=="" if exist "D:\Program Files (x86)\IIS Express\iisexpress.exe" set "IISEXPRESS=D:\Program Files (x86)\IIS Express\iisexpress.exe"

REM If still not found, search in PATH
if "%IISEXPRESS%"=="" (
    for %%X in (iisexpress.exe) do (
        if not "%%~$PATH:X"=="" set "IISEXPRESS=%%~$PATH:X"
    )
)

if "%IISEXPRESS%"=="" (
    echo [ERROR] IIS Express was not found on your system.
    echo.
    echo ASP.NET Web Forms (.aspx / .master) requires IIS Express or Visual Studio
    echo to compile and execute server-side code.
    echo.
    echo ---------------------------------------------------------------------
    echo HOW TO FIX IN 1 MINUTE:
    echo ---------------------------------------------------------------------
    echo 1. Download the official free Microsoft IIS Express installer (10 MB):
    echo    https://www.microsoft.com/en-us/download/details.aspx?id=48264
    echo.
    echo 2. Run the downloaded installer.
    echo.
    echo 3. Run this 'Run-IGNITE.bat' again!
    echo.
    echo (Alternatively: Open Visual Studio Installer and check the box
    echo  for "ASP.NET and web development").
    echo ---------------------------------------------------------------------
    echo.
    echo Press any key to open the official Microsoft IIS Express download page...
    pause >nul
    start "" "https://www.microsoft.com/en-us/download/details.aspx?id=48264"
    exit /b 1
)

echo [OK] Located IIS Express: "%IISEXPRESS%"
echo [OK] Project Directory:   "%~dp0IGNITE"
echo [OK] Local URL:           http://localhost:51240/Student/Dashboard.aspx
echo.
echo Launching browser...
timeout /t 1 /nobreak >nul
start "" "http://localhost:51240/Student/Dashboard.aspx"

echo.
echo =====================================================================
echo   SERVER IS RUNNING!
echo   Keep this window open while using the web app.
echo   To STOP the server: press Ctrl + C in this window.
echo =====================================================================
echo.

"%IISEXPRESS%" /path:"%~dp0IGNITE" /port:51240

pause
