@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (italy Part 1)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker italy-pt1 [Rome]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=italy&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Rome&& set SCRAPER_LOCALE=it&& set SCRAPER_RUN_ID=italy-pt1-w1&& call run-core.bat"
start "ScrapScrapWorker italy-pt1 [Milan]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=italy&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Milan&& set SCRAPER_LOCALE=it&& set SCRAPER_RUN_ID=italy-pt1-w2&& call run-core.bat"
start "ScrapScrapWorker italy-pt1 [Naples]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=italy&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Naples&& set SCRAPER_LOCALE=it&& set SCRAPER_RUN_ID=italy-pt1-w3&& call run-core.bat"
start "ScrapScrapWorker italy-pt1 [Turin]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=italy&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Turin&& set SCRAPER_LOCALE=it&& set SCRAPER_RUN_ID=italy-pt1-w4&& call run-core.bat"
start "ScrapScrapWorker italy-pt1 [Florence]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=italy&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Florence&& set SCRAPER_LOCALE=it&& set SCRAPER_RUN_ID=italy-pt1-w5&& call run-core.bat"
start "ScrapScrapWorker italy-pt1 [Bologna]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=italy&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Bologna&& set SCRAPER_LOCALE=it&& set SCRAPER_RUN_ID=italy-pt1-w6&& call run-core.bat"
start "ScrapScrapWorker italy-pt1 [Genoa]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=italy&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Genoa&& set SCRAPER_LOCALE=it&& set SCRAPER_RUN_ID=italy-pt1-w7&& call run-core.bat"
start "ScrapScrapWorker italy-pt1 [Palermo]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=italy&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Palermo&& set SCRAPER_LOCALE=it&& set SCRAPER_RUN_ID=italy-pt1-w8&& call run-core.bat"
start "ScrapScrapWorker italy-pt1 [Verona]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=italy&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Verona&& set SCRAPER_LOCALE=it&& set SCRAPER_RUN_ID=italy-pt1-w9&& call run-core.bat"
start "ScrapScrapWorker italy-pt1 [Venice]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=italy&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Venice&& set SCRAPER_LOCALE=it&& set SCRAPER_RUN_ID=italy-pt1-w10&& call run-core.bat"

echo Launched 10 worker(s) for italy-pt1.
echo Press any key to close this launcher console (workers will keep running).
pause >nul