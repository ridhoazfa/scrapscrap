@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (indonesia Part 4)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker indonesia-pt4 [Sorong]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=indonesia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Sorong&& set SCRAPER_LOCALE=id&& set SCRAPER_RUN_ID=indonesia-pt4-w1&& call run-core.bat"
start "ScrapScrapWorker indonesia-pt4 [Ambon]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=indonesia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Ambon&& set SCRAPER_LOCALE=id&& set SCRAPER_RUN_ID=indonesia-pt4-w2&& call run-core.bat"
start "ScrapScrapWorker indonesia-pt4 [Ternate]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=indonesia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Ternate&& set SCRAPER_LOCALE=id&& set SCRAPER_RUN_ID=indonesia-pt4-w3&& call run-core.bat"
start "ScrapScrapWorker indonesia-pt4 [Palu]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=indonesia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Palu&& set SCRAPER_LOCALE=id&& set SCRAPER_RUN_ID=indonesia-pt4-w4&& call run-core.bat"
start "ScrapScrapWorker indonesia-pt4 [Kendari]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=indonesia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Kendari&& set SCRAPER_LOCALE=id&& set SCRAPER_RUN_ID=indonesia-pt4-w5&& call run-core.bat"
start "ScrapScrapWorker indonesia-pt4 [Gorontalo]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=indonesia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Gorontalo&& set SCRAPER_LOCALE=id&& set SCRAPER_RUN_ID=indonesia-pt4-w6&& call run-core.bat"
start "ScrapScrapWorker indonesia-pt4 [Bengkulu]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=indonesia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Bengkulu&& set SCRAPER_LOCALE=id&& set SCRAPER_RUN_ID=indonesia-pt4-w7&& call run-core.bat"
start "ScrapScrapWorker indonesia-pt4 [Banda Aceh]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=indonesia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Banda Aceh&& set SCRAPER_LOCALE=id&& set SCRAPER_RUN_ID=indonesia-pt4-w8&& call run-core.bat"
start "ScrapScrapWorker indonesia-pt4 [Tarakan]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=indonesia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Tarakan&& set SCRAPER_LOCALE=id&& set SCRAPER_RUN_ID=indonesia-pt4-w9&& call run-core.bat"
start "ScrapScrapWorker indonesia-pt4 [Palangkaraya]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=indonesia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Palangkaraya&& set SCRAPER_LOCALE=id&& set SCRAPER_RUN_ID=indonesia-pt4-w10&& call run-core.bat"

echo Launched 10 worker(s) for indonesia-pt4.
echo Press any key to close this launcher console (workers will keep running).
pause >nul