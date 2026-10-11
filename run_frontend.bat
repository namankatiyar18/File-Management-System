@echo off
setlocal
title Filequh Frontend (Port 3000)
color 0B
echo ========================================================
echo               STARTING FILEQUH FRONTEND
echo ========================================================
echo.
cd /d "%~dp0frontend"

if not exist "node_modules\" (
    echo [INFO] Installing frontend dependencies...
    call npm install
)

echo [INFO] Starting Next.js development server...
echo [INFO] URL: http://localhost:3000
echo.
call npm run dev
pause
