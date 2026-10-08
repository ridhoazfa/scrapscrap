@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (liechtenstein Part 1)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker liechtenstein-pt1 [Vaduz]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=liechtenstein&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Vaduz&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=liechtenstein-pt1-w1&& call run-core.bat"
start "ScrapScrapWorker liechtenstein-pt1 [Schaan]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=liechtenstein&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Schaan&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=liechtenstein-pt1-w2&& call run-core.bat"
start "ScrapScrapWorker liechtenstein-pt1 [Triesen]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=liechtenstein&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Triesen&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=liechtenstein-pt1-w3&& call run-core.bat"
start "ScrapScrapWorker liechtenstein-pt1 [Balzers]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=liechtenstein&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Balzers&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=liechtenstein-pt1-w4&& call run-core.bat"

echo Launched 4 worker(s) for liechtenstein-pt1.
echo Press any key to close this launcher console (workers will keep running).
pause >nul