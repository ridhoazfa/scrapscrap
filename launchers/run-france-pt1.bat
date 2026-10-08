@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (france Part 1)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker france-pt1 [Paris]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=france&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Paris&& set SCRAPER_LOCALE=fr&& set SCRAPER_RUN_ID=france-pt1-w1&& call run-core.bat"
start "ScrapScrapWorker france-pt1 [Marseille]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=france&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Marseille&& set SCRAPER_LOCALE=fr&& set SCRAPER_RUN_ID=france-pt1-w2&& call run-core.bat"
start "ScrapScrapWorker france-pt1 [Lyon]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=france&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Lyon&& set SCRAPER_LOCALE=fr&& set SCRAPER_RUN_ID=france-pt1-w3&& call run-core.bat"
start "ScrapScrapWorker france-pt1 [Toulouse]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=france&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Toulouse&& set SCRAPER_LOCALE=fr&& set SCRAPER_RUN_ID=france-pt1-w4&& call run-core.bat"
start "ScrapScrapWorker france-pt1 [Nice]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=france&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Nice&& set SCRAPER_LOCALE=fr&& set SCRAPER_RUN_ID=france-pt1-w5&& call run-core.bat"
start "ScrapScrapWorker france-pt1 [Nantes]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=france&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Nantes&& set SCRAPER_LOCALE=fr&& set SCRAPER_RUN_ID=france-pt1-w6&& call run-core.bat"
start "ScrapScrapWorker france-pt1 [Montpellier]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=france&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Montpellier&& set SCRAPER_LOCALE=fr&& set SCRAPER_RUN_ID=france-pt1-w7&& call run-core.bat"
start "ScrapScrapWorker france-pt1 [Strasbourg]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=france&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Strasbourg&& set SCRAPER_LOCALE=fr&& set SCRAPER_RUN_ID=france-pt1-w8&& call run-core.bat"
start "ScrapScrapWorker france-pt1 [Bordeaux]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=france&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Bordeaux&& set SCRAPER_LOCALE=fr&& set SCRAPER_RUN_ID=france-pt1-w9&& call run-core.bat"
start "ScrapScrapWorker france-pt1 [Lille]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=france&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Lille&& set SCRAPER_LOCALE=fr&& set SCRAPER_RUN_ID=france-pt1-w10&& call run-core.bat"

echo Launched 10 worker(s) for france-pt1.
echo Press any key to close this launcher console (workers will keep running).
pause >nul