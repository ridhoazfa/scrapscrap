@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (australia Part 1)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker australia-pt1 [Sydney]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=australia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Sydney&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=australia-pt1-w1&& call run-core.bat"
start "ScrapScrapWorker australia-pt1 [Melbourne]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=australia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Melbourne&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=australia-pt1-w2&& call run-core.bat"
start "ScrapScrapWorker australia-pt1 [Brisbane]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=australia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Brisbane&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=australia-pt1-w3&& call run-core.bat"
start "ScrapScrapWorker australia-pt1 [Perth]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=australia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Perth&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=australia-pt1-w4&& call run-core.bat"
start "ScrapScrapWorker australia-pt1 [Adelaide]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=australia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Adelaide&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=australia-pt1-w5&& call run-core.bat"
start "ScrapScrapWorker australia-pt1 [Gold Coast]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=australia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Gold Coast&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=australia-pt1-w6&& call run-core.bat"
start "ScrapScrapWorker australia-pt1 [Canberra]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=australia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Canberra&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=australia-pt1-w7&& call run-core.bat"
start "ScrapScrapWorker australia-pt1 [Newcastle]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=australia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Newcastle&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=australia-pt1-w8&& call run-core.bat"
start "ScrapScrapWorker australia-pt1 [Wollongong]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=australia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Wollongong&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=australia-pt1-w9&& call run-core.bat"
start "ScrapScrapWorker australia-pt1 [Hobart]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=australia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Hobart&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=australia-pt1-w10&& call run-core.bat"

echo Launched 10 worker(s) for australia-pt1.
echo Press any key to close this launcher console (workers will keep running).
pause >nul