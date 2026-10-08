@echo off
REM ============================================================
REM  ScrapScrap — 1-Click Interactive Control Center
REM  Windows Quickstart Launcher
REM ============================================================
setlocal EnableDelayedExpansion
cd /d "%~dp0"

:menu
cls
echo ============================================================
echo   ScrapScrap - Local Google Maps & Email Harvester
echo ============================================================
echo.
echo   [1] Open Lead Studio Web Interface (http://localhost:3800)
echo   [2] Run USA Workers (Top 10 Cities)
echo   [3] Run Indonesia Workers (Top 10 Cities)
echo   [4] Run UK Workers (Top 10 Cities)
echo   [5] Run Custom Scrape (Specify City and Niche)
echo   [6] Verify Email Deliverability (5-Layer MX Check)
echo   [7] Export All Leads to CSV
echo   [8] Emergency Stop All Workers
echo   [9] Exit
echo.
set /p opt="Select an option [1-9]: "

if "%opt%"=="1" (
  echo Launching Lead Studio Web Interface on port 3800...
  start http://localhost:3800
  call npm run ui
  goto menu
)

if "%opt%"=="2" (
  echo Launching USA Part 1 Worker Pool...
  call launchers\run-united-states-pt1.bat
  goto menu
)

if "%opt%"=="3" (
  echo Launching Indonesia Part 1 Worker Pool...
  call launchers\run-indonesia-pt1.bat
  goto menu
)

if "%opt%"=="4" (
  echo Launching UK Part 1 Worker Pool...
  call launchers\run-united-kingdom-pt1.bat
  goto menu
)

if "%opt%"=="5" (
  echo.
  set /p cc="Enter Country Name (e.g. united-states, indonesia, australia): "
  set /p ci="Enter City Name (e.g. Austin, Jakarta, Sydney): "
  set /p ni="Enter Niche (e.g. Gym, Dental Clinic, Restaurant): "
  set /p mr="Enter Minimum Rating [default 4.0]: "
  if "!mr!"=="" set mr=4.0
  set /p mv="Enter Minimum Reviews [default 100]: "
  if "!mv!"=="" set mv=100
  echo.
  echo Starting scraper for !ci! (!ni!)...
  node src/cli.js --country "!cc!" --cities "!ci!" --niche "!ni!" --min-rating "!mr!" --min-reviews "!mv!"
  pause
  goto menu
)

if "%opt%"=="6" (
  echo.
  set /p targetEmail="Enter email address to verify: "
  echo.
  node src/cli.js --verify "!targetEmail!"
  echo.
  pause
  goto menu
)

if "%opt%"=="7" (
  echo.
  node src/cli.js --export "leads-export.csv"
  echo.
  pause
  goto menu
)

if "%opt%"=="8" (
  call stop-all.bat
  goto menu
)

if "%opt%"=="9" (
  exit /b 0
)

goto menu
