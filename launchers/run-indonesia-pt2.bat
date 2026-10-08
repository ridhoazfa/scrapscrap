@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (indonesia Part 2)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker indonesia-pt2 [Yogyakarta]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=indonesia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Yogyakarta&& set SCRAPER_LOCALE=id&& set SCRAPER_RUN_ID=indonesia-pt2-w1&& call run-core.bat"
start "ScrapScrapWorker indonesia-pt2 [Bali]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=indonesia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Bali&& set SCRAPER_LOCALE=id&& set SCRAPER_RUN_ID=indonesia-pt2-w2&& call run-core.bat"
start "ScrapScrapWorker indonesia-pt2 [Denpasar]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=indonesia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Denpasar&& set SCRAPER_LOCALE=id&& set SCRAPER_RUN_ID=indonesia-pt2-w3&& call run-core.bat"
start "ScrapScrapWorker indonesia-pt2 [Malang]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=indonesia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Malang&& set SCRAPER_LOCALE=id&& set SCRAPER_RUN_ID=indonesia-pt2-w4&& call run-core.bat"
start "ScrapScrapWorker indonesia-pt2 [Surakarta]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=indonesia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Surakarta&& set SCRAPER_LOCALE=id&& set SCRAPER_RUN_ID=indonesia-pt2-w5&& call run-core.bat"
start "ScrapScrapWorker indonesia-pt2 [Balikpapan]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=indonesia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Balikpapan&& set SCRAPER_LOCALE=id&& set SCRAPER_RUN_ID=indonesia-pt2-w6&& call run-core.bat"
start "ScrapScrapWorker indonesia-pt2 [Palembang]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=indonesia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Palembang&& set SCRAPER_LOCALE=id&& set SCRAPER_RUN_ID=indonesia-pt2-w7&& call run-core.bat"
start "ScrapScrapWorker indonesia-pt2 [Pekanbaru]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=indonesia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Pekanbaru&& set SCRAPER_LOCALE=id&& set SCRAPER_RUN_ID=indonesia-pt2-w8&& call run-core.bat"
start "ScrapScrapWorker indonesia-pt2 [Manado]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=indonesia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Manado&& set SCRAPER_LOCALE=id&& set SCRAPER_RUN_ID=indonesia-pt2-w9&& call run-core.bat"
start "ScrapScrapWorker indonesia-pt2 [Batam]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=indonesia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Batam&& set SCRAPER_LOCALE=id&& set SCRAPER_RUN_ID=indonesia-pt2-w10&& call run-core.bat"

echo Launched 10 worker(s) for indonesia-pt2.
echo Press any key to close this launcher console (workers will keep running).
pause >nul