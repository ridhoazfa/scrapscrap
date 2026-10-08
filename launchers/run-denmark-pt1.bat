@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (denmark Part 1)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker denmark-pt1 [Copenhagen]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=denmark&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Copenhagen&& set SCRAPER_LOCALE=da&& set SCRAPER_RUN_ID=denmark-pt1-w1&& call run-core.bat"
start "ScrapScrapWorker denmark-pt1 [Aarhus]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=denmark&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Aarhus&& set SCRAPER_LOCALE=da&& set SCRAPER_RUN_ID=denmark-pt1-w2&& call run-core.bat"
start "ScrapScrapWorker denmark-pt1 [Odense]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=denmark&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Odense&& set SCRAPER_LOCALE=da&& set SCRAPER_RUN_ID=denmark-pt1-w3&& call run-core.bat"
start "ScrapScrapWorker denmark-pt1 [Aalborg]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=denmark&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Aalborg&& set SCRAPER_LOCALE=da&& set SCRAPER_RUN_ID=denmark-pt1-w4&& call run-core.bat"
start "ScrapScrapWorker denmark-pt1 [Esbjerg]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=denmark&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Esbjerg&& set SCRAPER_LOCALE=da&& set SCRAPER_RUN_ID=denmark-pt1-w5&& call run-core.bat"
start "ScrapScrapWorker denmark-pt1 [Randers]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=denmark&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Randers&& set SCRAPER_LOCALE=da&& set SCRAPER_RUN_ID=denmark-pt1-w6&& call run-core.bat"
start "ScrapScrapWorker denmark-pt1 [Kolding]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=denmark&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Kolding&& set SCRAPER_LOCALE=da&& set SCRAPER_RUN_ID=denmark-pt1-w7&& call run-core.bat"
start "ScrapScrapWorker denmark-pt1 [Horsens]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=denmark&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Horsens&& set SCRAPER_LOCALE=da&& set SCRAPER_RUN_ID=denmark-pt1-w8&& call run-core.bat"
start "ScrapScrapWorker denmark-pt1 [Vejle]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=denmark&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Vejle&& set SCRAPER_LOCALE=da&& set SCRAPER_RUN_ID=denmark-pt1-w9&& call run-core.bat"
start "ScrapScrapWorker denmark-pt1 [Roskilde]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=denmark&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Roskilde&& set SCRAPER_LOCALE=da&& set SCRAPER_RUN_ID=denmark-pt1-w10&& call run-core.bat"

echo Launched 10 worker(s) for denmark-pt1.
echo Press any key to close this launcher console (workers will keep running).
pause >nul