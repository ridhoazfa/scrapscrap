@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (ireland Part 2)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker ireland-pt2 [Kilkenny]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=ireland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Kilkenny&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=ireland-pt2-w1&& call run-core.bat"
start "ScrapScrapWorker ireland-pt2 [Ennis]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=ireland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Ennis&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=ireland-pt2-w2&& call run-core.bat"
start "ScrapScrapWorker ireland-pt2 [Carlow]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=ireland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Carlow&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=ireland-pt2-w3&& call run-core.bat"
start "ScrapScrapWorker ireland-pt2 [Tralee]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=ireland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Tralee&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=ireland-pt2-w4&& call run-core.bat"
start "ScrapScrapWorker ireland-pt2 [Newbridge]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=ireland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Newbridge&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=ireland-pt2-w5&& call run-core.bat"
start "ScrapScrapWorker ireland-pt2 [Portlaoise]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=ireland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Portlaoise&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=ireland-pt2-w6&& call run-core.bat"
start "ScrapScrapWorker ireland-pt2 [Balbriggan]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=ireland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Balbriggan&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=ireland-pt2-w7&& call run-core.bat"
start "ScrapScrapWorker ireland-pt2 [Naas]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=ireland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Naas&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=ireland-pt2-w8&& call run-core.bat"
start "ScrapScrapWorker ireland-pt2 [Athlone]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=ireland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Athlone&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=ireland-pt2-w9&& call run-core.bat"
start "ScrapScrapWorker ireland-pt2 [Mullingar]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=ireland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Mullingar&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=ireland-pt2-w10&& call run-core.bat"

echo Launched 10 worker(s) for ireland-pt2.
echo Press any key to close this launcher console (workers will keep running).
pause >nul