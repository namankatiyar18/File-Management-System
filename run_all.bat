@echo off
setlocal
title Filequh Launcher
color 09
echo ========================================================
echo        STARTING FILEQUH FULL STACK SERVICES
echo ========================================================
echo.

echo [1/2] Starting Backend API on http://localhost:5000...
start "Filequh Backend (Port 5000)" /D "%~dp0backend" cmd /k npm run dev

timeout /t 3 >nul

echo [2/2] Starting Frontend UI on http://localhost:3000...
start "Filequh Frontend (Port 3000)" /D "%~dp0frontend" cmd /k npm run dev

echo.
echo ========================================================
echo   Both services are launching in separate windows!
echo.
echo   Frontend UI:  http://localhost:3000
echo   Backend API:  http://localhost:5000
echo   API Health:   http://localhost:5000/health
echo ========================================================
echo.
echo Press any key to open the web app in your browser...
pause >nul
start http://localhost:3000
