@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (united-states Part 4)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker united-states-pt4 [Albuquerque]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-states&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Albuquerque&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-states-pt4-w1&& call run-core.bat"
start "ScrapScrapWorker united-states-pt4 [Tucson]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-states&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Tucson&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-states-pt4-w2&& call run-core.bat"
start "ScrapScrapWorker united-states-pt4 [Fresno]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-states&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Fresno&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-states-pt4-w3&& call run-core.bat"
start "ScrapScrapWorker united-states-pt4 [Sacramento]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-states&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Sacramento&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-states-pt4-w4&& call run-core.bat"
start "ScrapScrapWorker united-states-pt4 [Mesa]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-states&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Mesa&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-states-pt4-w5&& call run-core.bat"
start "ScrapScrapWorker united-states-pt4 [Atlanta]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-states&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Atlanta&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-states-pt4-w6&& call run-core.bat"
start "ScrapScrapWorker united-states-pt4 [Kansas City]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-states&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Kansas City&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-states-pt4-w7&& call run-core.bat"
start "ScrapScrapWorker united-states-pt4 [Omaha]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-states&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Omaha&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-states-pt4-w8&& call run-core.bat"
start "ScrapScrapWorker united-states-pt4 [Raleigh]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-states&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Raleigh&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-states-pt4-w9&& call run-core.bat"
start "ScrapScrapWorker united-states-pt4 [Miami]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-states&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Miami&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-states-pt4-w10&& call run-core.bat"

echo Launched 10 worker(s) for united-states-pt4.
echo Press any key to close this launcher console (workers will keep running).
pause >nul