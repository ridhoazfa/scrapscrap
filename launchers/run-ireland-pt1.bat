@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (ireland Part 1)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker ireland-pt1 [Dublin]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=ireland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Dublin&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=ireland-pt1-w1&& call run-core.bat"
start "ScrapScrapWorker ireland-pt1 [Cork]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=ireland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Cork&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=ireland-pt1-w2&& call run-core.bat"
start "ScrapScrapWorker ireland-pt1 [Limerick]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=ireland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Limerick&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=ireland-pt1-w3&& call run-core.bat"
start "ScrapScrapWorker ireland-pt1 [Galway]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=ireland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Galway&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=ireland-pt1-w4&& call run-core.bat"
start "ScrapScrapWorker ireland-pt1 [Waterford]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=ireland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Waterford&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=ireland-pt1-w5&& call run-core.bat"
start "ScrapScrapWorker ireland-pt1 [Drogheda]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=ireland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Drogheda&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=ireland-pt1-w6&& call run-core.bat"
start "ScrapScrapWorker ireland-pt1 [Dundalk]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=ireland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Dundalk&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=ireland-pt1-w7&& call run-core.bat"
start "ScrapScrapWorker ireland-pt1 [Swords]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=ireland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Swords&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=ireland-pt1-w8&& call run-core.bat"
start "ScrapScrapWorker ireland-pt1 [Bray]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=ireland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Bray&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=ireland-pt1-w9&& call run-core.bat"
start "ScrapScrapWorker ireland-pt1 [Navan]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=ireland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Navan&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=ireland-pt1-w10&& call run-core.bat"

echo Launched 10 worker(s) for ireland-pt1.
echo Press any key to close this launcher console (workers will keep running).
pause >nul