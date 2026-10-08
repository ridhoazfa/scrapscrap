@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (canada Part 2)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker canada-pt2 [London]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=canada&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=London&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=canada-pt2-w1&& call run-core.bat"
start "ScrapScrapWorker canada-pt2 [Victoria]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=canada&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Victoria&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=canada-pt2-w2&& call run-core.bat"
start "ScrapScrapWorker canada-pt2 [Halifax]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=canada&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Halifax&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=canada-pt2-w3&& call run-core.bat"
start "ScrapScrapWorker canada-pt2 [Oshawa]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=canada&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Oshawa&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=canada-pt2-w4&& call run-core.bat"
start "ScrapScrapWorker canada-pt2 [Windsor]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=canada&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Windsor&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=canada-pt2-w5&& call run-core.bat"
start "ScrapScrapWorker canada-pt2 [Saskatoon]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=canada&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Saskatoon&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=canada-pt2-w6&& call run-core.bat"
start "ScrapScrapWorker canada-pt2 [Regina]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=canada&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Regina&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=canada-pt2-w7&& call run-core.bat"
start "ScrapScrapWorker canada-pt2 [St. John's]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=canada&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=St. John's&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=canada-pt2-w8&& call run-core.bat"
start "ScrapScrapWorker canada-pt2 [Barrie]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=canada&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Barrie&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=canada-pt2-w9&& call run-core.bat"
start "ScrapScrapWorker canada-pt2 [Kelowna]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=canada&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Kelowna&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=canada-pt2-w10&& call run-core.bat"

echo Launched 10 worker(s) for canada-pt2.
echo Press any key to close this launcher console (workers will keep running).
pause >nul