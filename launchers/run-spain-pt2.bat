@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (spain Part 2)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker spain-pt2 [Murcia]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=spain&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Murcia&& set SCRAPER_LOCALE=es&& set SCRAPER_RUN_ID=spain-pt2-w1&& call run-core.bat"
start "ScrapScrapWorker spain-pt2 [Cordoba]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=spain&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Cordoba&& set SCRAPER_LOCALE=es&& set SCRAPER_RUN_ID=spain-pt2-w2&& call run-core.bat"
start "ScrapScrapWorker spain-pt2 [Valladolid]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=spain&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Valladolid&& set SCRAPER_LOCALE=es&& set SCRAPER_RUN_ID=spain-pt2-w3&& call run-core.bat"
start "ScrapScrapWorker spain-pt2 [Vigo]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=spain&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Vigo&& set SCRAPER_LOCALE=es&& set SCRAPER_RUN_ID=spain-pt2-w4&& call run-core.bat"
start "ScrapScrapWorker spain-pt2 [Gijon]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=spain&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Gijon&& set SCRAPER_LOCALE=es&& set SCRAPER_RUN_ID=spain-pt2-w5&& call run-core.bat"
start "ScrapScrapWorker spain-pt2 [Hospitalet de Llobregat]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=spain&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Hospitalet de Llobregat&& set SCRAPER_LOCALE=es&& set SCRAPER_RUN_ID=spain-pt2-w6&& call run-core.bat"
start "ScrapScrapWorker spain-pt2 [Vitoria-Gasteiz]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=spain&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Vitoria-Gasteiz&& set SCRAPER_LOCALE=es&& set SCRAPER_RUN_ID=spain-pt2-w7&& call run-core.bat"
start "ScrapScrapWorker spain-pt2 [A Coruna]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=spain&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=A Coruna&& set SCRAPER_LOCALE=es&& set SCRAPER_RUN_ID=spain-pt2-w8&& call run-core.bat"
start "ScrapScrapWorker spain-pt2 [Elche]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=spain&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Elche&& set SCRAPER_LOCALE=es&& set SCRAPER_RUN_ID=spain-pt2-w9&& call run-core.bat"
start "ScrapScrapWorker spain-pt2 [Granada]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=spain&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Granada&& set SCRAPER_LOCALE=es&& set SCRAPER_RUN_ID=spain-pt2-w10&& call run-core.bat"

echo Launched 10 worker(s) for spain-pt2.
echo Press any key to close this launcher console (workers will keep running).
pause >nul