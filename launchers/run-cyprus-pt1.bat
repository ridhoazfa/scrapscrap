@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (cyprus Part 1)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker cyprus-pt1 [Nicosia]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=cyprus&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Nicosia&& set SCRAPER_LOCALE=el&& set SCRAPER_RUN_ID=cyprus-pt1-w1&& call run-core.bat"
start "ScrapScrapWorker cyprus-pt1 [Limassol]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=cyprus&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Limassol&& set SCRAPER_LOCALE=el&& set SCRAPER_RUN_ID=cyprus-pt1-w2&& call run-core.bat"
start "ScrapScrapWorker cyprus-pt1 [Larnaca]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=cyprus&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Larnaca&& set SCRAPER_LOCALE=el&& set SCRAPER_RUN_ID=cyprus-pt1-w3&& call run-core.bat"
start "ScrapScrapWorker cyprus-pt1 [Paphos]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=cyprus&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Paphos&& set SCRAPER_LOCALE=el&& set SCRAPER_RUN_ID=cyprus-pt1-w4&& call run-core.bat"
start "ScrapScrapWorker cyprus-pt1 [Famagusta]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=cyprus&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Famagusta&& set SCRAPER_LOCALE=el&& set SCRAPER_RUN_ID=cyprus-pt1-w5&& call run-core.bat"
start "ScrapScrapWorker cyprus-pt1 [Kyrenia]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=cyprus&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Kyrenia&& set SCRAPER_LOCALE=el&& set SCRAPER_RUN_ID=cyprus-pt1-w6&& call run-core.bat"

echo Launched 6 worker(s) for cyprus-pt1.
echo Press any key to close this launcher console (workers will keep running).
pause >nul