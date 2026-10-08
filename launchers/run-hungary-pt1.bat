@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (hungary Part 1)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker hungary-pt1 [Budapest]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=hungary&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Budapest&& set SCRAPER_LOCALE=hu&& set SCRAPER_RUN_ID=hungary-pt1-w1&& call run-core.bat"
start "ScrapScrapWorker hungary-pt1 [Debrecen]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=hungary&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Debrecen&& set SCRAPER_LOCALE=hu&& set SCRAPER_RUN_ID=hungary-pt1-w2&& call run-core.bat"
start "ScrapScrapWorker hungary-pt1 [Szeged]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=hungary&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Szeged&& set SCRAPER_LOCALE=hu&& set SCRAPER_RUN_ID=hungary-pt1-w3&& call run-core.bat"
start "ScrapScrapWorker hungary-pt1 [Miskolc]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=hungary&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Miskolc&& set SCRAPER_LOCALE=hu&& set SCRAPER_RUN_ID=hungary-pt1-w4&& call run-core.bat"
start "ScrapScrapWorker hungary-pt1 [Pecs]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=hungary&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Pecs&& set SCRAPER_LOCALE=hu&& set SCRAPER_RUN_ID=hungary-pt1-w5&& call run-core.bat"
start "ScrapScrapWorker hungary-pt1 [Gyor]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=hungary&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Gyor&& set SCRAPER_LOCALE=hu&& set SCRAPER_RUN_ID=hungary-pt1-w6&& call run-core.bat"
start "ScrapScrapWorker hungary-pt1 [Nyiregyhaza]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=hungary&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Nyiregyhaza&& set SCRAPER_LOCALE=hu&& set SCRAPER_RUN_ID=hungary-pt1-w7&& call run-core.bat"
start "ScrapScrapWorker hungary-pt1 [Kecskemet]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=hungary&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Kecskemet&& set SCRAPER_LOCALE=hu&& set SCRAPER_RUN_ID=hungary-pt1-w8&& call run-core.bat"
start "ScrapScrapWorker hungary-pt1 [Szekesfehervar]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=hungary&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Szekesfehervar&& set SCRAPER_LOCALE=hu&& set SCRAPER_RUN_ID=hungary-pt1-w9&& call run-core.bat"
start "ScrapScrapWorker hungary-pt1 [Szombathely]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=hungary&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Szombathely&& set SCRAPER_LOCALE=hu&& set SCRAPER_RUN_ID=hungary-pt1-w10&& call run-core.bat"

echo Launched 10 worker(s) for hungary-pt1.
echo Press any key to close this launcher console (workers will keep running).
pause >nul