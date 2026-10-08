@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (united-arab-emirates Part 1)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker united-arab-emirates-pt1 [Dubai]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-arab-emirates&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Dubai&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-arab-emirates-pt1-w1&& call run-core.bat"
start "ScrapScrapWorker united-arab-emirates-pt1 [Abu Dhabi]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-arab-emirates&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Abu Dhabi&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-arab-emirates-pt1-w2&& call run-core.bat"
start "ScrapScrapWorker united-arab-emirates-pt1 [Sharjah]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-arab-emirates&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Sharjah&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-arab-emirates-pt1-w3&& call run-core.bat"
start "ScrapScrapWorker united-arab-emirates-pt1 [Al Ain]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-arab-emirates&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Al Ain&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-arab-emirates-pt1-w4&& call run-core.bat"
start "ScrapScrapWorker united-arab-emirates-pt1 [Ajman]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-arab-emirates&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Ajman&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-arab-emirates-pt1-w5&& call run-core.bat"
start "ScrapScrapWorker united-arab-emirates-pt1 [Ras Al Khaimah]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-arab-emirates&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Ras Al Khaimah&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-arab-emirates-pt1-w6&& call run-core.bat"
start "ScrapScrapWorker united-arab-emirates-pt1 [Fujairah]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-arab-emirates&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Fujairah&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-arab-emirates-pt1-w7&& call run-core.bat"
start "ScrapScrapWorker united-arab-emirates-pt1 [Umm Al Quwain]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-arab-emirates&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Umm Al Quwain&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-arab-emirates-pt1-w8&& call run-core.bat"
start "ScrapScrapWorker united-arab-emirates-pt1 [Khor Fakkan]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-arab-emirates&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Khor Fakkan&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-arab-emirates-pt1-w9&& call run-core.bat"
start "ScrapScrapWorker united-arab-emirates-pt1 [Kalba]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-arab-emirates&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Kalba&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-arab-emirates-pt1-w10&& call run-core.bat"

echo Launched 10 worker(s) for united-arab-emirates-pt1.
echo Press any key to close this launcher console (workers will keep running).
pause >nul