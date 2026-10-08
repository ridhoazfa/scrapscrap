@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (canada Part 1)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker canada-pt1 [Toronto]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=canada&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Toronto&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=canada-pt1-w1&& call run-core.bat"
start "ScrapScrapWorker canada-pt1 [Montreal]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=canada&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Montreal&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=canada-pt1-w2&& call run-core.bat"
start "ScrapScrapWorker canada-pt1 [Vancouver]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=canada&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Vancouver&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=canada-pt1-w3&& call run-core.bat"
start "ScrapScrapWorker canada-pt1 [Calgary]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=canada&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Calgary&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=canada-pt1-w4&& call run-core.bat"
start "ScrapScrapWorker canada-pt1 [Edmonton]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=canada&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Edmonton&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=canada-pt1-w5&& call run-core.bat"
start "ScrapScrapWorker canada-pt1 [Ottawa]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=canada&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Ottawa&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=canada-pt1-w6&& call run-core.bat"
start "ScrapScrapWorker canada-pt1 [Winnipeg]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=canada&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Winnipeg&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=canada-pt1-w7&& call run-core.bat"
start "ScrapScrapWorker canada-pt1 [Quebec City]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=canada&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Quebec City&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=canada-pt1-w8&& call run-core.bat"
start "ScrapScrapWorker canada-pt1 [Hamilton]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=canada&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Hamilton&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=canada-pt1-w9&& call run-core.bat"
start "ScrapScrapWorker canada-pt1 [Kitchener]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=canada&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Kitchener&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=canada-pt1-w10&& call run-core.bat"

echo Launched 10 worker(s) for canada-pt1.
echo Press any key to close this launcher console (workers will keep running).
pause >nul