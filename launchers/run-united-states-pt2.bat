@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (united-states Part 2)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker united-states-pt2 [Austin]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-states&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Austin&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-states-pt2-w1&& call run-core.bat"
start "ScrapScrapWorker united-states-pt2 [Jacksonville]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-states&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Jacksonville&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-states-pt2-w2&& call run-core.bat"
start "ScrapScrapWorker united-states-pt2 [San Francisco]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-states&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=San Francisco&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-states-pt2-w3&& call run-core.bat"
start "ScrapScrapWorker united-states-pt2 [Indianapolis]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-states&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Indianapolis&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-states-pt2-w4&& call run-core.bat"
start "ScrapScrapWorker united-states-pt2 [Columbus]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-states&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Columbus&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-states-pt2-w5&& call run-core.bat"
start "ScrapScrapWorker united-states-pt2 [Fort Worth]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-states&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Fort Worth&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-states-pt2-w6&& call run-core.bat"
start "ScrapScrapWorker united-states-pt2 [Charlotte]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-states&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Charlotte&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-states-pt2-w7&& call run-core.bat"
start "ScrapScrapWorker united-states-pt2 [Seattle]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-states&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Seattle&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-states-pt2-w8&& call run-core.bat"
start "ScrapScrapWorker united-states-pt2 [Denver]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-states&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Denver&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-states-pt2-w9&& call run-core.bat"
start "ScrapScrapWorker united-states-pt2 [El Paso]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-states&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=El Paso&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-states-pt2-w10&& call run-core.bat"

echo Launched 10 worker(s) for united-states-pt2.
echo Press any key to close this launcher console (workers will keep running).
pause >nul