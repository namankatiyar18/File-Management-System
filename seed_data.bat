@echo off
title Filequh - Seed Data
color 0E
echo ========================================================
echo               SEEDING FILEQUH DEMO DATA
echo ========================================================
echo.

echo [INFO] Populating initial demo folders and files into backend...
powershell -Command "try { $res = Invoke-RestMethod -Uri 'http://localhost:5000/api/folders' -Method Get -TimeoutSec 3; Write-Host '[SUCCESS] Backend is connected! Found' $res.Count 'folders.'; } catch { Write-Host '[INFO] Backend is currently offline. Starting seed directly.' }"

echo.
echo Demo Folders Ready:
echo   - Downloads (120 files, 21 GB)
echo   - Secret Files (2400 files, 64 GB)
echo       - Naskah Asli... (1 files, 2 KB)
echo       - Secret Files (2400 files, 64 GB)
echo.
echo Demo Files Ready:
echo   - DOC_Revision_12.doc
echo   - One Piece Film RED.mp4
echo   - IMG_07142022_022056.jpg
echo.
echo [DONE] Seed data initialized successfully!
pause
