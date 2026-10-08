@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (united-states Part 1)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker united-states-pt1 [New York]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-states&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=New York&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-states-pt1-w1&& call run-core.bat"
start "ScrapScrapWorker united-states-pt1 [Los Angeles]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-states&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Los Angeles&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-states-pt1-w2&& call run-core.bat"
start "ScrapScrapWorker united-states-pt1 [Chicago]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-states&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Chicago&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-states-pt1-w3&& call run-core.bat"
start "ScrapScrapWorker united-states-pt1 [Houston]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-states&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Houston&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-states-pt1-w4&& call run-core.bat"
start "ScrapScrapWorker united-states-pt1 [Phoenix]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-states&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Phoenix&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-states-pt1-w5&& call run-core.bat"
start "ScrapScrapWorker united-states-pt1 [Philadelphia]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-states&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Philadelphia&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-states-pt1-w6&& call run-core.bat"
start "ScrapScrapWorker united-states-pt1 [San Antonio]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-states&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=San Antonio&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-states-pt1-w7&& call run-core.bat"
start "ScrapScrapWorker united-states-pt1 [San Diego]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-states&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=San Diego&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-states-pt1-w8&& call run-core.bat"
start "ScrapScrapWorker united-states-pt1 [Dallas]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-states&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Dallas&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-states-pt1-w9&& call run-core.bat"
start "ScrapScrapWorker united-states-pt1 [San Jose]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-states&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=San Jose&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-states-pt1-w10&& call run-core.bat"

echo Launched 10 worker(s) for united-states-pt1.
echo Press any key to close this launcher console (workers will keep running).
pause >nul