@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (finland Part 2)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker finland-pt2 [Kouvola]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=finland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Kouvola&& set SCRAPER_LOCALE=fi&& set SCRAPER_RUN_ID=finland-pt2-w1&& call run-core.bat"
start "ScrapScrapWorker finland-pt2 [Joensuu]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=finland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Joensuu&& set SCRAPER_LOCALE=fi&& set SCRAPER_RUN_ID=finland-pt2-w2&& call run-core.bat"
start "ScrapScrapWorker finland-pt2 [Lappeenranta]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=finland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Lappeenranta&& set SCRAPER_LOCALE=fi&& set SCRAPER_RUN_ID=finland-pt2-w3&& call run-core.bat"
start "ScrapScrapWorker finland-pt2 [Hameenlinna]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=finland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Hameenlinna&& set SCRAPER_LOCALE=fi&& set SCRAPER_RUN_ID=finland-pt2-w4&& call run-core.bat"
start "ScrapScrapWorker finland-pt2 [Vaasa]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=finland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Vaasa&& set SCRAPER_LOCALE=fi&& set SCRAPER_RUN_ID=finland-pt2-w5&& call run-core.bat"
start "ScrapScrapWorker finland-pt2 [Rovaniemi]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=finland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Rovaniemi&& set SCRAPER_LOCALE=fi&& set SCRAPER_RUN_ID=finland-pt2-w6&& call run-core.bat"
start "ScrapScrapWorker finland-pt2 [Seinajoki]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=finland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Seinajoki&& set SCRAPER_LOCALE=fi&& set SCRAPER_RUN_ID=finland-pt2-w7&& call run-core.bat"
start "ScrapScrapWorker finland-pt2 [Mikkeli]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=finland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Mikkeli&& set SCRAPER_LOCALE=fi&& set SCRAPER_RUN_ID=finland-pt2-w8&& call run-core.bat"
start "ScrapScrapWorker finland-pt2 [Kotka]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=finland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Kotka&& set SCRAPER_LOCALE=fi&& set SCRAPER_RUN_ID=finland-pt2-w9&& call run-core.bat"
start "ScrapScrapWorker finland-pt2 [Salo]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=finland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Salo&& set SCRAPER_LOCALE=fi&& set SCRAPER_RUN_ID=finland-pt2-w10&& call run-core.bat"

echo Launched 10 worker(s) for finland-pt2.
echo Press any key to close this launcher console (workers will keep running).
pause >nul