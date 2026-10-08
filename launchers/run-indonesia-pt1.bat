@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (indonesia Part 1)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker indonesia-pt1 [Jakarta]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=indonesia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Jakarta&& set SCRAPER_LOCALE=id&& set SCRAPER_RUN_ID=indonesia-pt1-w1&& call run-core.bat"
start "ScrapScrapWorker indonesia-pt1 [Surabaya]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=indonesia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Surabaya&& set SCRAPER_LOCALE=id&& set SCRAPER_RUN_ID=indonesia-pt1-w2&& call run-core.bat"
start "ScrapScrapWorker indonesia-pt1 [Bandung]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=indonesia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Bandung&& set SCRAPER_LOCALE=id&& set SCRAPER_RUN_ID=indonesia-pt1-w3&& call run-core.bat"
start "ScrapScrapWorker indonesia-pt1 [Medan]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=indonesia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Medan&& set SCRAPER_LOCALE=id&& set SCRAPER_RUN_ID=indonesia-pt1-w4&& call run-core.bat"
start "ScrapScrapWorker indonesia-pt1 [Semarang]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=indonesia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Semarang&& set SCRAPER_LOCALE=id&& set SCRAPER_RUN_ID=indonesia-pt1-w5&& call run-core.bat"
start "ScrapScrapWorker indonesia-pt1 [Makassar]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=indonesia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Makassar&& set SCRAPER_LOCALE=id&& set SCRAPER_RUN_ID=indonesia-pt1-w6&& call run-core.bat"
start "ScrapScrapWorker indonesia-pt1 [Tangerang]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=indonesia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Tangerang&& set SCRAPER_LOCALE=id&& set SCRAPER_RUN_ID=indonesia-pt1-w7&& call run-core.bat"
start "ScrapScrapWorker indonesia-pt1 [Bekasi]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=indonesia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Bekasi&& set SCRAPER_LOCALE=id&& set SCRAPER_RUN_ID=indonesia-pt1-w8&& call run-core.bat"
start "ScrapScrapWorker indonesia-pt1 [Depok]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=indonesia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Depok&& set SCRAPER_LOCALE=id&& set SCRAPER_RUN_ID=indonesia-pt1-w9&& call run-core.bat"
start "ScrapScrapWorker indonesia-pt1 [Bogor]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=indonesia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Bogor&& set SCRAPER_LOCALE=id&& set SCRAPER_RUN_ID=indonesia-pt1-w10&& call run-core.bat"

echo Launched 10 worker(s) for indonesia-pt1.
echo Press any key to close this launcher console (workers will keep running).
pause >nul