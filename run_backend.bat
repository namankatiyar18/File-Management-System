@echo off
setlocal
title Filequh Backend API (Port 5000)
color 0A
echo ========================================================
echo               STARTING FILEQUH BACKEND API
echo ========================================================
echo.
cd /d "%~dp0backend"

if not exist "node_modules\" (
    echo [INFO] Installing backend dependencies...
    call npm install
)

echo [INFO] Starting Express API server on port 5000...
echo [INFO] API URL: http://localhost:5000
echo [INFO] Health:  http://localhost:5000/health
echo.
call npm run dev
pause
