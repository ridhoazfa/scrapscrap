@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (united-kingdom Part 3)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker united-kingdom-pt3 [Plymouth]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-kingdom&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Plymouth&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-kingdom-pt3-w1&& call run-core.bat"
start "ScrapScrapWorker united-kingdom-pt3 [Wolverhampton]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-kingdom&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Wolverhampton&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-kingdom-pt3-w2&& call run-core.bat"
start "ScrapScrapWorker united-kingdom-pt3 [Swansea]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-kingdom&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Swansea&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-kingdom-pt3-w3&& call run-core.bat"
start "ScrapScrapWorker united-kingdom-pt3 [Aberdeen]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-kingdom&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Aberdeen&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-kingdom-pt3-w4&& call run-core.bat"
start "ScrapScrapWorker united-kingdom-pt3 [Bournemouth]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-kingdom&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Bournemouth&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-kingdom-pt3-w5&& call run-core.bat"
start "ScrapScrapWorker united-kingdom-pt3 [Norwich]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-kingdom&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Norwich&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-kingdom-pt3-w6&& call run-core.bat"
start "ScrapScrapWorker united-kingdom-pt3 [Milton Keynes]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-kingdom&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Milton Keynes&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-kingdom-pt3-w7&& call run-core.bat"
start "ScrapScrapWorker united-kingdom-pt3 [Swindon]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-kingdom&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Swindon&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-kingdom-pt3-w8&& call run-core.bat"
start "ScrapScrapWorker united-kingdom-pt3 [Luton]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-kingdom&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Luton&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-kingdom-pt3-w9&& call run-core.bat"
start "ScrapScrapWorker united-kingdom-pt3 [Oxford]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-kingdom&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Oxford&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-kingdom-pt3-w10&& call run-core.bat"

echo Launched 10 worker(s) for united-kingdom-pt3.
echo Press any key to close this launcher console (workers will keep running).
pause >nul