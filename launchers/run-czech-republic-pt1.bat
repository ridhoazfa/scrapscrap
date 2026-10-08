@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (czech-republic Part 1)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker czech-republic-pt1 [Prague]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=czech-republic&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Prague&& set SCRAPER_LOCALE=cs&& set SCRAPER_RUN_ID=czech-republic-pt1-w1&& call run-core.bat"
start "ScrapScrapWorker czech-republic-pt1 [Brno]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=czech-republic&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Brno&& set SCRAPER_LOCALE=cs&& set SCRAPER_RUN_ID=czech-republic-pt1-w2&& call run-core.bat"
start "ScrapScrapWorker czech-republic-pt1 [Ostrava]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=czech-republic&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Ostrava&& set SCRAPER_LOCALE=cs&& set SCRAPER_RUN_ID=czech-republic-pt1-w3&& call run-core.bat"
start "ScrapScrapWorker czech-republic-pt1 [Pilsen]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=czech-republic&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Pilsen&& set SCRAPER_LOCALE=cs&& set SCRAPER_RUN_ID=czech-republic-pt1-w4&& call run-core.bat"
start "ScrapScrapWorker czech-republic-pt1 [Liberec]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=czech-republic&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Liberec&& set SCRAPER_LOCALE=cs&& set SCRAPER_RUN_ID=czech-republic-pt1-w5&& call run-core.bat"
start "ScrapScrapWorker czech-republic-pt1 [Olomouc]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=czech-republic&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Olomouc&& set SCRAPER_LOCALE=cs&& set SCRAPER_RUN_ID=czech-republic-pt1-w6&& call run-core.bat"
start "ScrapScrapWorker czech-republic-pt1 [Ceske Budejovice]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=czech-republic&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Ceske Budejovice&& set SCRAPER_LOCALE=cs&& set SCRAPER_RUN_ID=czech-republic-pt1-w7&& call run-core.bat"
start "ScrapScrapWorker czech-republic-pt1 [Hradec Kralove]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=czech-republic&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Hradec Kralove&& set SCRAPER_LOCALE=cs&& set SCRAPER_RUN_ID=czech-republic-pt1-w8&& call run-core.bat"
start "ScrapScrapWorker czech-republic-pt1 [Usti nad Labem]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=czech-republic&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Usti nad Labem&& set SCRAPER_LOCALE=cs&& set SCRAPER_RUN_ID=czech-republic-pt1-w9&& call run-core.bat"
start "ScrapScrapWorker czech-republic-pt1 [Pardubice]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=czech-republic&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Pardubice&& set SCRAPER_LOCALE=cs&& set SCRAPER_RUN_ID=czech-republic-pt1-w10&& call run-core.bat"

echo Launched 10 worker(s) for czech-republic-pt1.
echo Press any key to close this launcher console (workers will keep running).
pause >nul