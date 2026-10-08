@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (brazil Part 2)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker brazil-pt2 [Belem]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=brazil&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Belem&& set SCRAPER_LOCALE=pt&& set SCRAPER_RUN_ID=brazil-pt2-w1&& call run-core.bat"
start "ScrapScrapWorker brazil-pt2 [Goiania]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=brazil&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Goiania&& set SCRAPER_LOCALE=pt&& set SCRAPER_RUN_ID=brazil-pt2-w2&& call run-core.bat"
start "ScrapScrapWorker brazil-pt2 [Guarulhos]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=brazil&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Guarulhos&& set SCRAPER_LOCALE=pt&& set SCRAPER_RUN_ID=brazil-pt2-w3&& call run-core.bat"
start "ScrapScrapWorker brazil-pt2 [Campinas]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=brazil&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Campinas&& set SCRAPER_LOCALE=pt&& set SCRAPER_RUN_ID=brazil-pt2-w4&& call run-core.bat"
start "ScrapScrapWorker brazil-pt2 [Sao Luis]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=brazil&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Sao Luis&& set SCRAPER_LOCALE=pt&& set SCRAPER_RUN_ID=brazil-pt2-w5&& call run-core.bat"
start "ScrapScrapWorker brazil-pt2 [Sao Goncalo]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=brazil&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Sao Goncalo&& set SCRAPER_LOCALE=pt&& set SCRAPER_RUN_ID=brazil-pt2-w6&& call run-core.bat"
start "ScrapScrapWorker brazil-pt2 [Maceio]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=brazil&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Maceio&& set SCRAPER_LOCALE=pt&& set SCRAPER_RUN_ID=brazil-pt2-w7&& call run-core.bat"
start "ScrapScrapWorker brazil-pt2 [Duque de Caxias]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=brazil&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Duque de Caxias&& set SCRAPER_LOCALE=pt&& set SCRAPER_RUN_ID=brazil-pt2-w8&& call run-core.bat"
start "ScrapScrapWorker brazil-pt2 [Natal]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=brazil&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Natal&& set SCRAPER_LOCALE=pt&& set SCRAPER_RUN_ID=brazil-pt2-w9&& call run-core.bat"
start "ScrapScrapWorker brazil-pt2 [Teresina]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=brazil&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Teresina&& set SCRAPER_LOCALE=pt&& set SCRAPER_RUN_ID=brazil-pt2-w10&& call run-core.bat"

echo Launched 10 worker(s) for brazil-pt2.
echo Press any key to close this launcher console (workers will keep running).
pause >nul