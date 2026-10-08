@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (austria Part 1)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker austria-pt1 [Vienna]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=austria&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Vienna&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=austria-pt1-w1&& call run-core.bat"
start "ScrapScrapWorker austria-pt1 [Graz]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=austria&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Graz&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=austria-pt1-w2&& call run-core.bat"
start "ScrapScrapWorker austria-pt1 [Linz]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=austria&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Linz&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=austria-pt1-w3&& call run-core.bat"
start "ScrapScrapWorker austria-pt1 [Salzburg]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=austria&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Salzburg&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=austria-pt1-w4&& call run-core.bat"
start "ScrapScrapWorker austria-pt1 [Innsbruck]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=austria&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Innsbruck&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=austria-pt1-w5&& call run-core.bat"
start "ScrapScrapWorker austria-pt1 [Klagenfurt]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=austria&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Klagenfurt&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=austria-pt1-w6&& call run-core.bat"
start "ScrapScrapWorker austria-pt1 [Villach]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=austria&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Villach&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=austria-pt1-w7&& call run-core.bat"
start "ScrapScrapWorker austria-pt1 [Wels]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=austria&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Wels&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=austria-pt1-w8&& call run-core.bat"
start "ScrapScrapWorker austria-pt1 [Sankt Polten]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=austria&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Sankt Polten&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=austria-pt1-w9&& call run-core.bat"
start "ScrapScrapWorker austria-pt1 [Dornbirn]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=austria&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Dornbirn&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=austria-pt1-w10&& call run-core.bat"

echo Launched 10 worker(s) for austria-pt1.
echo Press any key to close this launcher console (workers will keep running).
pause >nul