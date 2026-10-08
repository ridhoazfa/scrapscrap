@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (spain Part 1)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker spain-pt1 [Madrid]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=spain&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Madrid&& set SCRAPER_LOCALE=es&& set SCRAPER_RUN_ID=spain-pt1-w1&& call run-core.bat"
start "ScrapScrapWorker spain-pt1 [Barcelona]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=spain&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Barcelona&& set SCRAPER_LOCALE=es&& set SCRAPER_RUN_ID=spain-pt1-w2&& call run-core.bat"
start "ScrapScrapWorker spain-pt1 [Valencia]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=spain&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Valencia&& set SCRAPER_LOCALE=es&& set SCRAPER_RUN_ID=spain-pt1-w3&& call run-core.bat"
start "ScrapScrapWorker spain-pt1 [Seville]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=spain&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Seville&& set SCRAPER_LOCALE=es&& set SCRAPER_RUN_ID=spain-pt1-w4&& call run-core.bat"
start "ScrapScrapWorker spain-pt1 [Bilbao]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=spain&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Bilbao&& set SCRAPER_LOCALE=es&& set SCRAPER_RUN_ID=spain-pt1-w5&& call run-core.bat"
start "ScrapScrapWorker spain-pt1 [Malaga]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=spain&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Malaga&& set SCRAPER_LOCALE=es&& set SCRAPER_RUN_ID=spain-pt1-w6&& call run-core.bat"
start "ScrapScrapWorker spain-pt1 [Zaragoza]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=spain&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Zaragoza&& set SCRAPER_LOCALE=es&& set SCRAPER_RUN_ID=spain-pt1-w7&& call run-core.bat"
start "ScrapScrapWorker spain-pt1 [Palma de Mallorca]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=spain&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Palma de Mallorca&& set SCRAPER_LOCALE=es&& set SCRAPER_RUN_ID=spain-pt1-w8&& call run-core.bat"
start "ScrapScrapWorker spain-pt1 [Las Palmas]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=spain&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Las Palmas&& set SCRAPER_LOCALE=es&& set SCRAPER_RUN_ID=spain-pt1-w9&& call run-core.bat"
start "ScrapScrapWorker spain-pt1 [Alicante]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=spain&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Alicante&& set SCRAPER_LOCALE=es&& set SCRAPER_RUN_ID=spain-pt1-w10&& call run-core.bat"

echo Launched 10 worker(s) for spain-pt1.
echo Press any key to close this launcher console (workers will keep running).
pause >nul