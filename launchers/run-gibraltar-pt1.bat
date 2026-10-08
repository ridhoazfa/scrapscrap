@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (gibraltar Part 1)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker gibraltar-pt1 [Gibraltar]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=gibraltar&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Gibraltar&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=gibraltar-pt1-w1&& call run-core.bat"

echo Launched 1 worker(s) for gibraltar-pt1.
echo Press any key to close this launcher console (workers will keep running).
pause >nul