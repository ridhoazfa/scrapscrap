@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (malta Part 1)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker malta-pt1 [Valletta]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=malta&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Valletta&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=malta-pt1-w1&& call run-core.bat"
start "ScrapScrapWorker malta-pt1 [Birkirkara]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=malta&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Birkirkara&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=malta-pt1-w2&& call run-core.bat"
start "ScrapScrapWorker malta-pt1 [Mosta]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=malta&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Mosta&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=malta-pt1-w3&& call run-core.bat"
start "ScrapScrapWorker malta-pt1 [Sliema]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=malta&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Sliema&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=malta-pt1-w4&& call run-core.bat"
start "ScrapScrapWorker malta-pt1 [Qormi]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=malta&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Qormi&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=malta-pt1-w5&& call run-core.bat"
start "ScrapScrapWorker malta-pt1 [Zabbar]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=malta&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Zabbar&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=malta-pt1-w6&& call run-core.bat"
start "ScrapScrapWorker malta-pt1 [San Pawl il-Bahar]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=malta&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=San Pawl il-Bahar&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=malta-pt1-w7&& call run-core.bat"
start "ScrapScrapWorker malta-pt1 [St. Julian's]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=malta&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=St. Julian's&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=malta-pt1-w8&& call run-core.bat"

echo Launched 8 worker(s) for malta-pt1.
echo Press any key to close this launcher console (workers will keep running).
pause >nul