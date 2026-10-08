@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (france Part 2)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker france-pt2 [Rennes]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=france&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Rennes&& set SCRAPER_LOCALE=fr&& set SCRAPER_RUN_ID=france-pt2-w1&& call run-core.bat"
start "ScrapScrapWorker france-pt2 [Reims]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=france&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Reims&& set SCRAPER_LOCALE=fr&& set SCRAPER_RUN_ID=france-pt2-w2&& call run-core.bat"
start "ScrapScrapWorker france-pt2 [Saint-Etienne]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=france&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Saint-Etienne&& set SCRAPER_LOCALE=fr&& set SCRAPER_RUN_ID=france-pt2-w3&& call run-core.bat"
start "ScrapScrapWorker france-pt2 [Le Havre]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=france&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Le Havre&& set SCRAPER_LOCALE=fr&& set SCRAPER_RUN_ID=france-pt2-w4&& call run-core.bat"
start "ScrapScrapWorker france-pt2 [Toulon]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=france&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Toulon&& set SCRAPER_LOCALE=fr&& set SCRAPER_RUN_ID=france-pt2-w5&& call run-core.bat"
start "ScrapScrapWorker france-pt2 [Grenoble]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=france&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Grenoble&& set SCRAPER_LOCALE=fr&& set SCRAPER_RUN_ID=france-pt2-w6&& call run-core.bat"
start "ScrapScrapWorker france-pt2 [Dijon]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=france&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Dijon&& set SCRAPER_LOCALE=fr&& set SCRAPER_RUN_ID=france-pt2-w7&& call run-core.bat"
start "ScrapScrapWorker france-pt2 [Angers]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=france&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Angers&& set SCRAPER_LOCALE=fr&& set SCRAPER_RUN_ID=france-pt2-w8&& call run-core.bat"
start "ScrapScrapWorker france-pt2 [Nimes]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=france&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Nimes&& set SCRAPER_LOCALE=fr&& set SCRAPER_RUN_ID=france-pt2-w9&& call run-core.bat"
start "ScrapScrapWorker france-pt2 [Villeurbanne]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=france&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Villeurbanne&& set SCRAPER_LOCALE=fr&& set SCRAPER_RUN_ID=france-pt2-w10&& call run-core.bat"

echo Launched 10 worker(s) for france-pt2.
echo Press any key to close this launcher console (workers will keep running).
pause >nul