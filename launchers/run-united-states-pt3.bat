@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (united-states Part 3)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker united-states-pt3 [Boston]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-states&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Boston&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-states-pt3-w1&& call run-core.bat"
start "ScrapScrapWorker united-states-pt3 [Nashville]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-states&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Nashville&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-states-pt3-w2&& call run-core.bat"
start "ScrapScrapWorker united-states-pt3 [Detroit]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-states&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Detroit&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-states-pt3-w3&& call run-core.bat"
start "ScrapScrapWorker united-states-pt3 [Portland]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-states&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Portland&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-states-pt3-w4&& call run-core.bat"
start "ScrapScrapWorker united-states-pt3 [Memphis]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-states&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Memphis&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-states-pt3-w5&& call run-core.bat"
start "ScrapScrapWorker united-states-pt3 [Oklahoma City]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-states&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Oklahoma City&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-states-pt3-w6&& call run-core.bat"
start "ScrapScrapWorker united-states-pt3 [Las Vegas]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-states&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Las Vegas&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-states-pt3-w7&& call run-core.bat"
start "ScrapScrapWorker united-states-pt3 [Louisville]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-states&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Louisville&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-states-pt3-w8&& call run-core.bat"
start "ScrapScrapWorker united-states-pt3 [Baltimore]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-states&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Baltimore&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-states-pt3-w9&& call run-core.bat"
start "ScrapScrapWorker united-states-pt3 [Milwaukee]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-states&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Milwaukee&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-states-pt3-w10&& call run-core.bat"

echo Launched 10 worker(s) for united-states-pt3.
echo Press any key to close this launcher console (workers will keep running).
pause >nul