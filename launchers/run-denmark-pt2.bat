@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (denmark Part 2)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker denmark-pt2 [Herning]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=denmark&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Herning&& set SCRAPER_LOCALE=da&& set SCRAPER_RUN_ID=denmark-pt2-w1&& call run-core.bat"
start "ScrapScrapWorker denmark-pt2 [Helsingor]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=denmark&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Helsingor&& set SCRAPER_LOCALE=da&& set SCRAPER_RUN_ID=denmark-pt2-w2&& call run-core.bat"
start "ScrapScrapWorker denmark-pt2 [Silkeborg]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=denmark&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Silkeborg&& set SCRAPER_LOCALE=da&& set SCRAPER_RUN_ID=denmark-pt2-w3&& call run-core.bat"
start "ScrapScrapWorker denmark-pt2 [Naestved]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=denmark&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Naestved&& set SCRAPER_LOCALE=da&& set SCRAPER_RUN_ID=denmark-pt2-w4&& call run-core.bat"
start "ScrapScrapWorker denmark-pt2 [Viborg]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=denmark&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Viborg&& set SCRAPER_LOCALE=da&& set SCRAPER_RUN_ID=denmark-pt2-w5&& call run-core.bat"
start "ScrapScrapWorker denmark-pt2 [Fredericia]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=denmark&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Fredericia&& set SCRAPER_LOCALE=da&& set SCRAPER_RUN_ID=denmark-pt2-w6&& call run-core.bat"
start "ScrapScrapWorker denmark-pt2 [Ballerup]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=denmark&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Ballerup&& set SCRAPER_LOCALE=da&& set SCRAPER_RUN_ID=denmark-pt2-w7&& call run-core.bat"
start "ScrapScrapWorker denmark-pt2 [Holstebro]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=denmark&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Holstebro&& set SCRAPER_LOCALE=da&& set SCRAPER_RUN_ID=denmark-pt2-w8&& call run-core.bat"
start "ScrapScrapWorker denmark-pt2 [Taastrup]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=denmark&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Taastrup&& set SCRAPER_LOCALE=da&& set SCRAPER_RUN_ID=denmark-pt2-w9&& call run-core.bat"
start "ScrapScrapWorker denmark-pt2 [Slagelse]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=denmark&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Slagelse&& set SCRAPER_LOCALE=da&& set SCRAPER_RUN_ID=denmark-pt2-w10&& call run-core.bat"

echo Launched 10 worker(s) for denmark-pt2.
echo Press any key to close this launcher console (workers will keep running).
pause >nul