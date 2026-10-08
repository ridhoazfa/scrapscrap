@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (slovenia Part 1)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker slovenia-pt1 [Ljubljana]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=slovenia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Ljubljana&& set SCRAPER_LOCALE=sl&& set SCRAPER_RUN_ID=slovenia-pt1-w1&& call run-core.bat"
start "ScrapScrapWorker slovenia-pt1 [Maribor]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=slovenia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Maribor&& set SCRAPER_LOCALE=sl&& set SCRAPER_RUN_ID=slovenia-pt1-w2&& call run-core.bat"
start "ScrapScrapWorker slovenia-pt1 [Celje]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=slovenia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Celje&& set SCRAPER_LOCALE=sl&& set SCRAPER_RUN_ID=slovenia-pt1-w3&& call run-core.bat"
start "ScrapScrapWorker slovenia-pt1 [Kranj]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=slovenia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Kranj&& set SCRAPER_LOCALE=sl&& set SCRAPER_RUN_ID=slovenia-pt1-w4&& call run-core.bat"
start "ScrapScrapWorker slovenia-pt1 [Velenje]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=slovenia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Velenje&& set SCRAPER_LOCALE=sl&& set SCRAPER_RUN_ID=slovenia-pt1-w5&& call run-core.bat"
start "ScrapScrapWorker slovenia-pt1 [Koper]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=slovenia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Koper&& set SCRAPER_LOCALE=sl&& set SCRAPER_RUN_ID=slovenia-pt1-w6&& call run-core.bat"
start "ScrapScrapWorker slovenia-pt1 [Novo Mesto]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=slovenia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Novo Mesto&& set SCRAPER_LOCALE=sl&& set SCRAPER_RUN_ID=slovenia-pt1-w7&& call run-core.bat"
start "ScrapScrapWorker slovenia-pt1 [Ptuj]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=slovenia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Ptuj&& set SCRAPER_LOCALE=sl&& set SCRAPER_RUN_ID=slovenia-pt1-w8&& call run-core.bat"
start "ScrapScrapWorker slovenia-pt1 [Trbovlje]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=slovenia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Trbovlje&& set SCRAPER_LOCALE=sl&& set SCRAPER_RUN_ID=slovenia-pt1-w9&& call run-core.bat"
start "ScrapScrapWorker slovenia-pt1 [Kamnik]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=slovenia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Kamnik&& set SCRAPER_LOCALE=sl&& set SCRAPER_RUN_ID=slovenia-pt1-w10&& call run-core.bat"

echo Launched 10 worker(s) for slovenia-pt1.
echo Press any key to close this launcher console (workers will keep running).
pause >nul