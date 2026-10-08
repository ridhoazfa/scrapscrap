@echo off
REM ============================================================
REM  ScrapScrap Emergency Stop Script
REM  Signals all running workers to terminate and cleans zombie processes.
REM ============================================================
cd /d "%~dp0"

echo ============================================
echo   Stopping All ScrapScrap Workers
echo ============================================

if not exist "data\state" mkdir "data\state"
type nul > "data\state\STOP_ALL_SCRAPERS"

echo Signal sent to active workers. Terminating orphaned browser processes...
timeout /t 2 /nobreak >nul

taskkill /F /FI "WINDOWTITLE eq ScrapScrapWorker*" >nul 2>&1
taskkill /F /IM chrome.exe /T >nul 2>&1
taskkill /F /IM chromium.exe /T >nul 2>&1

timeout /t 1 /nobreak >nul
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

echo.
echo All workers stopped and state cleared.
pause
