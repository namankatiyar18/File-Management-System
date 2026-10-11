@echo off
setlocal
title START FILEQUH - Full Stack Launcher
color 0F
echo ========================================================
echo        FILEQUH — CLOUD FILE MANAGEMENT SYSTEM
echo ========================================================
echo.

:: Check Node.js
where node >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] Node.js is not installed or not in PATH!
    echo Please install Node.js from https://nodejs.org
    pause
    exit /b 1
)

echo [OK] Node.js is ready.

:: Launch services via run_all.bat
call "%~dp0run_all.bat"
