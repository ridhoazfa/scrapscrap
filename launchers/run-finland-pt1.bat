@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (finland Part 1)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker finland-pt1 [Helsinki]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=finland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Helsinki&& set SCRAPER_LOCALE=fi&& set SCRAPER_RUN_ID=finland-pt1-w1&& call run-core.bat"
start "ScrapScrapWorker finland-pt1 [Espoo]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=finland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Espoo&& set SCRAPER_LOCALE=fi&& set SCRAPER_RUN_ID=finland-pt1-w2&& call run-core.bat"
start "ScrapScrapWorker finland-pt1 [Tampere]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=finland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Tampere&& set SCRAPER_LOCALE=fi&& set SCRAPER_RUN_ID=finland-pt1-w3&& call run-core.bat"
start "ScrapScrapWorker finland-pt1 [Vantaa]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=finland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Vantaa&& set SCRAPER_LOCALE=fi&& set SCRAPER_RUN_ID=finland-pt1-w4&& call run-core.bat"
start "ScrapScrapWorker finland-pt1 [Oulu]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=finland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Oulu&& set SCRAPER_LOCALE=fi&& set SCRAPER_RUN_ID=finland-pt1-w5&& call run-core.bat"
start "ScrapScrapWorker finland-pt1 [Turku]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=finland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Turku&& set SCRAPER_LOCALE=fi&& set SCRAPER_RUN_ID=finland-pt1-w6&& call run-core.bat"
start "ScrapScrapWorker finland-pt1 [Jyvaskyla]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=finland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Jyvaskyla&& set SCRAPER_LOCALE=fi&& set SCRAPER_RUN_ID=finland-pt1-w7&& call run-core.bat"
start "ScrapScrapWorker finland-pt1 [Lahti]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=finland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Lahti&& set SCRAPER_LOCALE=fi&& set SCRAPER_RUN_ID=finland-pt1-w8&& call run-core.bat"
start "ScrapScrapWorker finland-pt1 [Kuopio]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=finland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Kuopio&& set SCRAPER_LOCALE=fi&& set SCRAPER_RUN_ID=finland-pt1-w9&& call run-core.bat"
start "ScrapScrapWorker finland-pt1 [Pori]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=finland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Pori&& set SCRAPER_LOCALE=fi&& set SCRAPER_RUN_ID=finland-pt1-w10&& call run-core.bat"

echo Launched 10 worker(s) for finland-pt1.
echo Press any key to close this launcher console (workers will keep running).
pause >nul