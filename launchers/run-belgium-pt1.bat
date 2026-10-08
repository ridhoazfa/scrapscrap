@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (belgium Part 1)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker belgium-pt1 [Brussels]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=belgium&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Brussels&& set SCRAPER_LOCALE=nl&& set SCRAPER_RUN_ID=belgium-pt1-w1&& call run-core.bat"
start "ScrapScrapWorker belgium-pt1 [Antwerp]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=belgium&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Antwerp&& set SCRAPER_LOCALE=nl&& set SCRAPER_RUN_ID=belgium-pt1-w2&& call run-core.bat"
start "ScrapScrapWorker belgium-pt1 [Ghent]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=belgium&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Ghent&& set SCRAPER_LOCALE=nl&& set SCRAPER_RUN_ID=belgium-pt1-w3&& call run-core.bat"
start "ScrapScrapWorker belgium-pt1 [Charleroi]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=belgium&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Charleroi&& set SCRAPER_LOCALE=nl&& set SCRAPER_RUN_ID=belgium-pt1-w4&& call run-core.bat"
start "ScrapScrapWorker belgium-pt1 [Liege]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=belgium&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Liege&& set SCRAPER_LOCALE=nl&& set SCRAPER_RUN_ID=belgium-pt1-w5&& call run-core.bat"
start "ScrapScrapWorker belgium-pt1 [Bruges]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=belgium&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Bruges&& set SCRAPER_LOCALE=nl&& set SCRAPER_RUN_ID=belgium-pt1-w6&& call run-core.bat"
start "ScrapScrapWorker belgium-pt1 [Namur]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=belgium&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Namur&& set SCRAPER_LOCALE=nl&& set SCRAPER_RUN_ID=belgium-pt1-w7&& call run-core.bat"
start "ScrapScrapWorker belgium-pt1 [Leuven]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=belgium&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Leuven&& set SCRAPER_LOCALE=nl&& set SCRAPER_RUN_ID=belgium-pt1-w8&& call run-core.bat"
start "ScrapScrapWorker belgium-pt1 [Mons]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=belgium&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Mons&& set SCRAPER_LOCALE=nl&& set SCRAPER_RUN_ID=belgium-pt1-w9&& call run-core.bat"
start "ScrapScrapWorker belgium-pt1 [Aalst]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=belgium&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Aalst&& set SCRAPER_LOCALE=nl&& set SCRAPER_RUN_ID=belgium-pt1-w10&& call run-core.bat"

echo Launched 10 worker(s) for belgium-pt1.
echo Press any key to close this launcher console (workers will keep running).
pause >nul