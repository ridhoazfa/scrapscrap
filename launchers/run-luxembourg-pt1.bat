@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (luxembourg Part 1)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker luxembourg-pt1 [Luxembourg City]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=luxembourg&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Luxembourg City&& set SCRAPER_LOCALE=fr&& set SCRAPER_RUN_ID=luxembourg-pt1-w1&& call run-core.bat"
start "ScrapScrapWorker luxembourg-pt1 [Esch-sur-Alzette]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=luxembourg&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Esch-sur-Alzette&& set SCRAPER_LOCALE=fr&& set SCRAPER_RUN_ID=luxembourg-pt1-w2&& call run-core.bat"
start "ScrapScrapWorker luxembourg-pt1 [Differdange]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=luxembourg&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Differdange&& set SCRAPER_LOCALE=fr&& set SCRAPER_RUN_ID=luxembourg-pt1-w3&& call run-core.bat"
start "ScrapScrapWorker luxembourg-pt1 [Dudelange]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=luxembourg&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Dudelange&& set SCRAPER_LOCALE=fr&& set SCRAPER_RUN_ID=luxembourg-pt1-w4&& call run-core.bat"
start "ScrapScrapWorker luxembourg-pt1 [Ettelbruck]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=luxembourg&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Ettelbruck&& set SCRAPER_LOCALE=fr&& set SCRAPER_RUN_ID=luxembourg-pt1-w5&& call run-core.bat"

echo Launched 5 worker(s) for luxembourg-pt1.
echo Press any key to close this launcher console (workers will keep running).
pause >nul