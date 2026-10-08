@echo off
REM ============================================================
REM  ScrapScrap Core Runner - CAPTCHA-backoff restart loop
REM  Consumed by launchers in launchers\ or quickstart.bat
REM ============================================================
setlocal EnableDelayedExpansion
cd /d "%~dp0"

REM Resolve safe RUN_ID for log file
if "%SCRAPER_RUN_ID%"=="" set SCRAPER_RUN_ID=global
if not exist logs mkdir logs
set LOGFILE=logs\%SCRAPER_RUN_ID%.log

if not exist "node_modules" (
  echo Installing dependencies...
  call npm install
)

set BACKOFF_SECS=10
set SESSION_COUNT=0

:loop
if exist "%~dp0data\state\STOP_ALL_SCRAPERS" (
  echo.
  echo [STOPPED] Global stop signal detected: exiting worker cleanly.
  >>"%LOGFILE%" echo [%DATE% %TIME%] GLOBAL_STOP run=%SCRAPER_RUN_ID% session=%SESSION_COUNT%
  exit /b 0
)
set /a SESSION_COUNT+=1

set "SESSION_DISPLAY=%SESSION_COUNT%"
if %SESSION_COUNT% gtr 999 set "SESSION_DISPLAY=999+"

echo ============================================
echo   ScrapScrap Google Maps & Email Harvester
echo   Run ID: %SCRAPER_RUN_ID%
echo   Locale: %SCRAPER_LOCALE%
echo   Cities: %SCRAPER_CITIES%
echo   Session: %SESSION_DISPLAY% (Backoff: %BACKOFF_SECS%s)
echo ============================================

>>"%LOGFILE%" echo [%DATE% %TIME%] SESSION_START run=%SCRAPER_RUN_ID% session=%SESSION_COUNT% locale=%SCRAPER_LOCALE% cities=%SCRAPER_CITIES%

if "%SCRAPER_NO_GLOBAL_KILL%"=="1" (
  echo [MULTI-WORKER] SCRAPER_NO_GLOBAL_KILL=1 active. Protecting peer worker processes.
) else (
  taskkill /F /IM chrome.exe /T >nul 2>&1
  taskkill /F /IM chromium.exe /T >nul 2>&1
)

node --max-old-space-size=8192 src\core\scraper.js
set EXIT_CODE=%errorlevel%

>>"%LOGFILE%" echo [%DATE% %TIME%] SESSION_EXIT run=%SCRAPER_RUN_ID% session=%SESSION_COUNT% exit=%EXIT_CODE%

if exist "%~dp0data\state\STOP_ALL_SCRAPERS" (
  echo.
  echo [STOPPED] Global stop signal detected: exiting worker cleanly.
  >>"%LOGFILE%" echo [%DATE% %TIME%] GLOBAL_STOP run=%SCRAPER_RUN_ID% session=%SESSION_COUNT%
  exit /b 0
)

if %EXIT_CODE% equ 130 exit /b 0
if %EXIT_CODE% equ -1073741510 exit /b 0
if %EXIT_CODE% equ 3221225786 exit /b 0

if %EXIT_CODE% equ 2 (
  echo.
  echo [CAPTCHA] Rate-limit backoff: auto-relaunching in %BACKOFF_SECS% seconds...
  >>"%LOGFILE%" echo [%DATE% %TIME%] CAPTCHA_RETRY run=%SCRAPER_RUN_ID% session=%SESSION_COUNT% backoff=%BACKOFF_SECS%s
  timeout /t %BACKOFF_SECS% /nobreak >nul
  set /a BACKOFF_SECS*=2
  if !BACKOFF_SECS! gtr 120 set BACKOFF_SECS=120
  goto loop
)

if %EXIT_CODE% neq 0 (
  echo.
  echo [CRASH] Scraper exited with code %EXIT_CODE%: restarting in 2 seconds...
  >>"%LOGFILE%" echo [%DATE% %TIME%] CRASH run=%SCRAPER_RUN_ID% session=%SESSION_COUNT% exit=%EXIT_CODE%
  timeout /t 2 /nobreak >nul
  goto loop
)

set BACKOFF_SECS=10
echo.
echo [SUCCESS] Pass completed. Instant pass relaunch in 1 second...
>>"%LOGFILE%" echo [%DATE% %TIME%] SUCCESS run=%SCRAPER_RUN_ID% session=%SESSION_COUNT%
timeout /t 1 /nobreak >nul
goto loop
