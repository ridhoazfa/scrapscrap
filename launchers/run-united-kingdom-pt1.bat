@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (united-kingdom Part 1)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker united-kingdom-pt1 [London]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-kingdom&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=London&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-kingdom-pt1-w1&& call run-core.bat"
start "ScrapScrapWorker united-kingdom-pt1 [Birmingham]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-kingdom&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Birmingham&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-kingdom-pt1-w2&& call run-core.bat"
start "ScrapScrapWorker united-kingdom-pt1 [Glasgow]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-kingdom&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Glasgow&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-kingdom-pt1-w3&& call run-core.bat"
start "ScrapScrapWorker united-kingdom-pt1 [Liverpool]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-kingdom&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Liverpool&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-kingdom-pt1-w4&& call run-core.bat"
start "ScrapScrapWorker united-kingdom-pt1 [Bristol]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-kingdom&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Bristol&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-kingdom-pt1-w5&& call run-core.bat"
start "ScrapScrapWorker united-kingdom-pt1 [Manchester]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-kingdom&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Manchester&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-kingdom-pt1-w6&& call run-core.bat"
start "ScrapScrapWorker united-kingdom-pt1 [Sheffield]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-kingdom&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Sheffield&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-kingdom-pt1-w7&& call run-core.bat"
start "ScrapScrapWorker united-kingdom-pt1 [Leeds]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-kingdom&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Leeds&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-kingdom-pt1-w8&& call run-core.bat"
start "ScrapScrapWorker united-kingdom-pt1 [Edinburgh]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-kingdom&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Edinburgh&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-kingdom-pt1-w9&& call run-core.bat"
start "ScrapScrapWorker united-kingdom-pt1 [Leicester]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-kingdom&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Leicester&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-kingdom-pt1-w10&& call run-core.bat"

echo Launched 10 worker(s) for united-kingdom-pt1.
echo Press any key to close this launcher console (workers will keep running).
pause >nul