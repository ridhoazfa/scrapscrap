@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (italy Part 2)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker italy-pt2 [Bari]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=italy&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Bari&& set SCRAPER_LOCALE=it&& set SCRAPER_RUN_ID=italy-pt2-w1&& call run-core.bat"
start "ScrapScrapWorker italy-pt2 [Catania]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=italy&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Catania&& set SCRAPER_LOCALE=it&& set SCRAPER_RUN_ID=italy-pt2-w2&& call run-core.bat"
start "ScrapScrapWorker italy-pt2 [Messina]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=italy&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Messina&& set SCRAPER_LOCALE=it&& set SCRAPER_RUN_ID=italy-pt2-w3&& call run-core.bat"
start "ScrapScrapWorker italy-pt2 [Padua]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=italy&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Padua&& set SCRAPER_LOCALE=it&& set SCRAPER_RUN_ID=italy-pt2-w4&& call run-core.bat"
start "ScrapScrapWorker italy-pt2 [Trieste]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=italy&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Trieste&& set SCRAPER_LOCALE=it&& set SCRAPER_RUN_ID=italy-pt2-w5&& call run-core.bat"
start "ScrapScrapWorker italy-pt2 [Brescia]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=italy&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Brescia&& set SCRAPER_LOCALE=it&& set SCRAPER_RUN_ID=italy-pt2-w6&& call run-core.bat"
start "ScrapScrapWorker italy-pt2 [Taranto]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=italy&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Taranto&& set SCRAPER_LOCALE=it&& set SCRAPER_RUN_ID=italy-pt2-w7&& call run-core.bat"
start "ScrapScrapWorker italy-pt2 [Prato]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=italy&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Prato&& set SCRAPER_LOCALE=it&& set SCRAPER_RUN_ID=italy-pt2-w8&& call run-core.bat"
start "ScrapScrapWorker italy-pt2 [Reggio Calabria]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=italy&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Reggio Calabria&& set SCRAPER_LOCALE=it&& set SCRAPER_RUN_ID=italy-pt2-w9&& call run-core.bat"
start "ScrapScrapWorker italy-pt2 [Modena]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=italy&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Modena&& set SCRAPER_LOCALE=it&& set SCRAPER_RUN_ID=italy-pt2-w10&& call run-core.bat"

echo Launched 10 worker(s) for italy-pt2.
echo Press any key to close this launcher console (workers will keep running).
pause >nul