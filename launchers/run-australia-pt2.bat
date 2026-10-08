@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (australia Part 2)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker australia-pt2 [Geelong]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=australia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Geelong&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=australia-pt2-w1&& call run-core.bat"
start "ScrapScrapWorker australia-pt2 [Townsville]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=australia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Townsville&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=australia-pt2-w2&& call run-core.bat"
start "ScrapScrapWorker australia-pt2 [Cairns]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=australia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Cairns&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=australia-pt2-w3&& call run-core.bat"
start "ScrapScrapWorker australia-pt2 [Toowoomba]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=australia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Toowoomba&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=australia-pt2-w4&& call run-core.bat"
start "ScrapScrapWorker australia-pt2 [Ballarat]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=australia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Ballarat&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=australia-pt2-w5&& call run-core.bat"
start "ScrapScrapWorker australia-pt2 [Bendigo]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=australia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Bendigo&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=australia-pt2-w6&& call run-core.bat"
start "ScrapScrapWorker australia-pt2 [Albury]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=australia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Albury&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=australia-pt2-w7&& call run-core.bat"
start "ScrapScrapWorker australia-pt2 [Launceston]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=australia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Launceston&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=australia-pt2-w8&& call run-core.bat"
start "ScrapScrapWorker australia-pt2 [Mackay]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=australia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Mackay&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=australia-pt2-w9&& call run-core.bat"
start "ScrapScrapWorker australia-pt2 [Rockhampton]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=australia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Rockhampton&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=australia-pt2-w10&& call run-core.bat"

echo Launched 10 worker(s) for australia-pt2.
echo Press any key to close this launcher console (workers will keep running).
pause >nul