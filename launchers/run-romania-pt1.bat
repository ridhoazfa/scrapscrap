@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (romania Part 1)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker romania-pt1 [Bucharest]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=romania&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Bucharest&& set SCRAPER_LOCALE=ro&& set SCRAPER_RUN_ID=romania-pt1-w1&& call run-core.bat"
start "ScrapScrapWorker romania-pt1 [Cluj-Napoca]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=romania&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Cluj-Napoca&& set SCRAPER_LOCALE=ro&& set SCRAPER_RUN_ID=romania-pt1-w2&& call run-core.bat"
start "ScrapScrapWorker romania-pt1 [Timisoara]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=romania&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Timisoara&& set SCRAPER_LOCALE=ro&& set SCRAPER_RUN_ID=romania-pt1-w3&& call run-core.bat"
start "ScrapScrapWorker romania-pt1 [Iasi]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=romania&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Iasi&& set SCRAPER_LOCALE=ro&& set SCRAPER_RUN_ID=romania-pt1-w4&& call run-core.bat"
start "ScrapScrapWorker romania-pt1 [Constanta]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=romania&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Constanta&& set SCRAPER_LOCALE=ro&& set SCRAPER_RUN_ID=romania-pt1-w5&& call run-core.bat"
start "ScrapScrapWorker romania-pt1 [Craiova]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=romania&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Craiova&& set SCRAPER_LOCALE=ro&& set SCRAPER_RUN_ID=romania-pt1-w6&& call run-core.bat"
start "ScrapScrapWorker romania-pt1 [Brasov]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=romania&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Brasov&& set SCRAPER_LOCALE=ro&& set SCRAPER_RUN_ID=romania-pt1-w7&& call run-core.bat"
start "ScrapScrapWorker romania-pt1 [Galati]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=romania&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Galati&& set SCRAPER_LOCALE=ro&& set SCRAPER_RUN_ID=romania-pt1-w8&& call run-core.bat"
start "ScrapScrapWorker romania-pt1 [Ploiesti]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=romania&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Ploiesti&& set SCRAPER_LOCALE=ro&& set SCRAPER_RUN_ID=romania-pt1-w9&& call run-core.bat"
start "ScrapScrapWorker romania-pt1 [Oradea]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=romania&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Oradea&& set SCRAPER_LOCALE=ro&& set SCRAPER_RUN_ID=romania-pt1-w10&& call run-core.bat"

echo Launched 10 worker(s) for romania-pt1.
echo Press any key to close this launcher console (workers will keep running).
pause >nul