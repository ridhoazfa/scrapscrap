@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (ghana Part 1)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker ghana-pt1 [Accra]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=ghana&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Accra&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=ghana-pt1-w1&& call run-core.bat"
start "ScrapScrapWorker ghana-pt1 [Kumasi]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=ghana&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Kumasi&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=ghana-pt1-w2&& call run-core.bat"
start "ScrapScrapWorker ghana-pt1 [Takoradi]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=ghana&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Takoradi&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=ghana-pt1-w3&& call run-core.bat"
start "ScrapScrapWorker ghana-pt1 [Tamale]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=ghana&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Tamale&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=ghana-pt1-w4&& call run-core.bat"
start "ScrapScrapWorker ghana-pt1 [Tema]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=ghana&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Tema&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=ghana-pt1-w5&& call run-core.bat"
start "ScrapScrapWorker ghana-pt1 [Cape Coast]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=ghana&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Cape Coast&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=ghana-pt1-w6&& call run-core.bat"
start "ScrapScrapWorker ghana-pt1 [Sekondi]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=ghana&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Sekondi&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=ghana-pt1-w7&& call run-core.bat"
start "ScrapScrapWorker ghana-pt1 [Obuasi]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=ghana&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Obuasi&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=ghana-pt1-w8&& call run-core.bat"
start "ScrapScrapWorker ghana-pt1 [Madina]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=ghana&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Madina&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=ghana-pt1-w9&& call run-core.bat"
start "ScrapScrapWorker ghana-pt1 [Koforidua]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=ghana&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Koforidua&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=ghana-pt1-w10&& call run-core.bat"

echo Launched 10 worker(s) for ghana-pt1.
echo Press any key to close this launcher console (workers will keep running).
pause >nul