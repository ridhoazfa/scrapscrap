@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (netherlands Part 1)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker netherlands-pt1 [Amsterdam]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=netherlands&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Amsterdam&& set SCRAPER_LOCALE=nl&& set SCRAPER_RUN_ID=netherlands-pt1-w1&& call run-core.bat"
start "ScrapScrapWorker netherlands-pt1 [Rotterdam]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=netherlands&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Rotterdam&& set SCRAPER_LOCALE=nl&& set SCRAPER_RUN_ID=netherlands-pt1-w2&& call run-core.bat"
start "ScrapScrapWorker netherlands-pt1 [The Hague]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=netherlands&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=The Hague&& set SCRAPER_LOCALE=nl&& set SCRAPER_RUN_ID=netherlands-pt1-w3&& call run-core.bat"
start "ScrapScrapWorker netherlands-pt1 [Utrecht]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=netherlands&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Utrecht&& set SCRAPER_LOCALE=nl&& set SCRAPER_RUN_ID=netherlands-pt1-w4&& call run-core.bat"
start "ScrapScrapWorker netherlands-pt1 [Eindhoven]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=netherlands&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Eindhoven&& set SCRAPER_LOCALE=nl&& set SCRAPER_RUN_ID=netherlands-pt1-w5&& call run-core.bat"
start "ScrapScrapWorker netherlands-pt1 [Tilburg]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=netherlands&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Tilburg&& set SCRAPER_LOCALE=nl&& set SCRAPER_RUN_ID=netherlands-pt1-w6&& call run-core.bat"
start "ScrapScrapWorker netherlands-pt1 [Groningen]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=netherlands&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Groningen&& set SCRAPER_LOCALE=nl&& set SCRAPER_RUN_ID=netherlands-pt1-w7&& call run-core.bat"
start "ScrapScrapWorker netherlands-pt1 [Almere]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=netherlands&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Almere&& set SCRAPER_LOCALE=nl&& set SCRAPER_RUN_ID=netherlands-pt1-w8&& call run-core.bat"
start "ScrapScrapWorker netherlands-pt1 [Breda]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=netherlands&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Breda&& set SCRAPER_LOCALE=nl&& set SCRAPER_RUN_ID=netherlands-pt1-w9&& call run-core.bat"
start "ScrapScrapWorker netherlands-pt1 [Nijmegen]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=netherlands&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Nijmegen&& set SCRAPER_LOCALE=nl&& set SCRAPER_RUN_ID=netherlands-pt1-w10&& call run-core.bat"

echo Launched 10 worker(s) for netherlands-pt1.
echo Press any key to close this launcher console (workers will keep running).
pause >nul