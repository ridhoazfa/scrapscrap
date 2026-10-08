@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (united-kingdom Part 2)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker united-kingdom-pt2 [Coventry]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-kingdom&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Coventry&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-kingdom-pt2-w1&& call run-core.bat"
start "ScrapScrapWorker united-kingdom-pt2 [Bradford]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-kingdom&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Bradford&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-kingdom-pt2-w2&& call run-core.bat"
start "ScrapScrapWorker united-kingdom-pt2 [Cardiff]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-kingdom&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Cardiff&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-kingdom-pt2-w3&& call run-core.bat"
start "ScrapScrapWorker united-kingdom-pt2 [Belfast]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-kingdom&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Belfast&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-kingdom-pt2-w4&& call run-core.bat"
start "ScrapScrapWorker united-kingdom-pt2 [Nottingham]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-kingdom&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Nottingham&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-kingdom-pt2-w5&& call run-core.bat"
start "ScrapScrapWorker united-kingdom-pt2 [Kingston upon Hull]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-kingdom&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Kingston upon Hull&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-kingdom-pt2-w6&& call run-core.bat"
start "ScrapScrapWorker united-kingdom-pt2 [Newcastle upon Tyne]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-kingdom&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Newcastle upon Tyne&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-kingdom-pt2-w7&& call run-core.bat"
start "ScrapScrapWorker united-kingdom-pt2 [Stoke-on-Trent]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-kingdom&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Stoke-on-Trent&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-kingdom-pt2-w8&& call run-core.bat"
start "ScrapScrapWorker united-kingdom-pt2 [Southampton]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-kingdom&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Southampton&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-kingdom-pt2-w9&& call run-core.bat"
start "ScrapScrapWorker united-kingdom-pt2 [Derby]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-kingdom&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Derby&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-kingdom-pt2-w10&& call run-core.bat"

echo Launched 10 worker(s) for united-kingdom-pt2.
echo Press any key to close this launcher console (workers will keep running).
pause >nul