@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (indonesia Part 3)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker indonesia-pt3 [Pontianak]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=indonesia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Pontianak&& set SCRAPER_LOCALE=id&& set SCRAPER_RUN_ID=indonesia-pt3-w1&& call run-core.bat"
start "ScrapScrapWorker indonesia-pt3 [Banjarmasin]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=indonesia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Banjarmasin&& set SCRAPER_LOCALE=id&& set SCRAPER_RUN_ID=indonesia-pt3-w2&& call run-core.bat"
start "ScrapScrapWorker indonesia-pt3 [Samarinda]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=indonesia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Samarinda&& set SCRAPER_LOCALE=id&& set SCRAPER_RUN_ID=indonesia-pt3-w3&& call run-core.bat"
start "ScrapScrapWorker indonesia-pt3 [Tasikmalaya]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=indonesia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Tasikmalaya&& set SCRAPER_LOCALE=id&& set SCRAPER_RUN_ID=indonesia-pt3-w4&& call run-core.bat"
start "ScrapScrapWorker indonesia-pt3 [Bandar Lampung]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=indonesia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Bandar Lampung&& set SCRAPER_LOCALE=id&& set SCRAPER_RUN_ID=indonesia-pt3-w5&& call run-core.bat"
start "ScrapScrapWorker indonesia-pt3 [Cimahi]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=indonesia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Cimahi&& set SCRAPER_LOCALE=id&& set SCRAPER_RUN_ID=indonesia-pt3-w6&& call run-core.bat"
start "ScrapScrapWorker indonesia-pt3 [Cirebon]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=indonesia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Cirebon&& set SCRAPER_LOCALE=id&& set SCRAPER_RUN_ID=indonesia-pt3-w7&& call run-core.bat"
start "ScrapScrapWorker indonesia-pt3 [Mataram]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=indonesia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Mataram&& set SCRAPER_LOCALE=id&& set SCRAPER_RUN_ID=indonesia-pt3-w8&& call run-core.bat"
start "ScrapScrapWorker indonesia-pt3 [Kupang]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=indonesia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Kupang&& set SCRAPER_LOCALE=id&& set SCRAPER_RUN_ID=indonesia-pt3-w9&& call run-core.bat"
start "ScrapScrapWorker indonesia-pt3 [Jayapura]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=indonesia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Jayapura&& set SCRAPER_LOCALE=id&& set SCRAPER_RUN_ID=indonesia-pt3-w10&& call run-core.bat"

echo Launched 10 worker(s) for indonesia-pt3.
echo Press any key to close this launcher console (workers will keep running).
pause >nul