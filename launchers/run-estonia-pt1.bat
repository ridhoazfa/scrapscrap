@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (estonia Part 1)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker estonia-pt1 [Tallinn]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=estonia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Tallinn&& set SCRAPER_LOCALE=et&& set SCRAPER_RUN_ID=estonia-pt1-w1&& call run-core.bat"
start "ScrapScrapWorker estonia-pt1 [Tartu]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=estonia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Tartu&& set SCRAPER_LOCALE=et&& set SCRAPER_RUN_ID=estonia-pt1-w2&& call run-core.bat"
start "ScrapScrapWorker estonia-pt1 [Narva]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=estonia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Narva&& set SCRAPER_LOCALE=et&& set SCRAPER_RUN_ID=estonia-pt1-w3&& call run-core.bat"
start "ScrapScrapWorker estonia-pt1 [Parnu]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=estonia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Parnu&& set SCRAPER_LOCALE=et&& set SCRAPER_RUN_ID=estonia-pt1-w4&& call run-core.bat"
start "ScrapScrapWorker estonia-pt1 [Kohtla-Jarve]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=estonia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Kohtla-Jarve&& set SCRAPER_LOCALE=et&& set SCRAPER_RUN_ID=estonia-pt1-w5&& call run-core.bat"
start "ScrapScrapWorker estonia-pt1 [Viljandi]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=estonia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Viljandi&& set SCRAPER_LOCALE=et&& set SCRAPER_RUN_ID=estonia-pt1-w6&& call run-core.bat"
start "ScrapScrapWorker estonia-pt1 [Rakvere]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=estonia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Rakvere&& set SCRAPER_LOCALE=et&& set SCRAPER_RUN_ID=estonia-pt1-w7&& call run-core.bat"
start "ScrapScrapWorker estonia-pt1 [Maardu]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=estonia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Maardu&& set SCRAPER_LOCALE=et&& set SCRAPER_RUN_ID=estonia-pt1-w8&& call run-core.bat"
start "ScrapScrapWorker estonia-pt1 [Kuressaare]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=estonia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Kuressaare&& set SCRAPER_LOCALE=et&& set SCRAPER_RUN_ID=estonia-pt1-w9&& call run-core.bat"
start "ScrapScrapWorker estonia-pt1 [Voros]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=estonia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Voros&& set SCRAPER_LOCALE=et&& set SCRAPER_RUN_ID=estonia-pt1-w10&& call run-core.bat"

echo Launched 10 worker(s) for estonia-pt1.
echo Press any key to close this launcher console (workers will keep running).
pause >nul