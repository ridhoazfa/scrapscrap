@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (brazil Part 1)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker brazil-pt1 [Sao Paulo]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=brazil&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Sao Paulo&& set SCRAPER_LOCALE=pt&& set SCRAPER_RUN_ID=brazil-pt1-w1&& call run-core.bat"
start "ScrapScrapWorker brazil-pt1 [Rio de Janeiro]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=brazil&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Rio de Janeiro&& set SCRAPER_LOCALE=pt&& set SCRAPER_RUN_ID=brazil-pt1-w2&& call run-core.bat"
start "ScrapScrapWorker brazil-pt1 [Brasilia]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=brazil&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Brasilia&& set SCRAPER_LOCALE=pt&& set SCRAPER_RUN_ID=brazil-pt1-w3&& call run-core.bat"
start "ScrapScrapWorker brazil-pt1 [Salvador]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=brazil&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Salvador&& set SCRAPER_LOCALE=pt&& set SCRAPER_RUN_ID=brazil-pt1-w4&& call run-core.bat"
start "ScrapScrapWorker brazil-pt1 [Fortaleza]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=brazil&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Fortaleza&& set SCRAPER_LOCALE=pt&& set SCRAPER_RUN_ID=brazil-pt1-w5&& call run-core.bat"
start "ScrapScrapWorker brazil-pt1 [Belo Horizonte]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=brazil&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Belo Horizonte&& set SCRAPER_LOCALE=pt&& set SCRAPER_RUN_ID=brazil-pt1-w6&& call run-core.bat"
start "ScrapScrapWorker brazil-pt1 [Manaus]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=brazil&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Manaus&& set SCRAPER_LOCALE=pt&& set SCRAPER_RUN_ID=brazil-pt1-w7&& call run-core.bat"
start "ScrapScrapWorker brazil-pt1 [Curitiba]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=brazil&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Curitiba&& set SCRAPER_LOCALE=pt&& set SCRAPER_RUN_ID=brazil-pt1-w8&& call run-core.bat"
start "ScrapScrapWorker brazil-pt1 [Recife]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=brazil&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Recife&& set SCRAPER_LOCALE=pt&& set SCRAPER_RUN_ID=brazil-pt1-w9&& call run-core.bat"
start "ScrapScrapWorker brazil-pt1 [Porto Alegre]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=brazil&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Porto Alegre&& set SCRAPER_LOCALE=pt&& set SCRAPER_RUN_ID=brazil-pt1-w10&& call run-core.bat"

echo Launched 10 worker(s) for brazil-pt1.
echo Press any key to close this launcher console (workers will keep running).
pause >nul