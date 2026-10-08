@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (norway Part 2)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker norway-pt2 [Tonsberg]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=norway&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Tonsberg&& set SCRAPER_LOCALE=no&& set SCRAPER_RUN_ID=norway-pt2-w1&& call run-core.bat"
start "ScrapScrapWorker norway-pt2 [Moss]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=norway&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Moss&& set SCRAPER_LOCALE=no&& set SCRAPER_RUN_ID=norway-pt2-w2&& call run-core.bat"
start "ScrapScrapWorker norway-pt2 [Haugesund]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=norway&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Haugesund&& set SCRAPER_LOCALE=no&& set SCRAPER_RUN_ID=norway-pt2-w3&& call run-core.bat"
start "ScrapScrapWorker norway-pt2 [Sandefjord]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=norway&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Sandefjord&& set SCRAPER_LOCALE=no&& set SCRAPER_RUN_ID=norway-pt2-w4&& call run-core.bat"
start "ScrapScrapWorker norway-pt2 [Arendal]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=norway&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Arendal&& set SCRAPER_LOCALE=no&& set SCRAPER_RUN_ID=norway-pt2-w5&& call run-core.bat"
start "ScrapScrapWorker norway-pt2 [Bodoe]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=norway&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Bodoe&& set SCRAPER_LOCALE=no&& set SCRAPER_RUN_ID=norway-pt2-w6&& call run-core.bat"
start "ScrapScrapWorker norway-pt2 [Tromsoe]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=norway&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Tromsoe&& set SCRAPER_LOCALE=no&& set SCRAPER_RUN_ID=norway-pt2-w7&& call run-core.bat"
start "ScrapScrapWorker norway-pt2 [Hamar]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=norway&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Hamar&& set SCRAPER_LOCALE=no&& set SCRAPER_RUN_ID=norway-pt2-w8&& call run-core.bat"
start "ScrapScrapWorker norway-pt2 [Larvik]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=norway&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Larvik&& set SCRAPER_LOCALE=no&& set SCRAPER_RUN_ID=norway-pt2-w9&& call run-core.bat"
start "ScrapScrapWorker norway-pt2 [Halden]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=norway&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Halden&& set SCRAPER_LOCALE=no&& set SCRAPER_RUN_ID=norway-pt2-w10&& call run-core.bat"

echo Launched 10 worker(s) for norway-pt2.
echo Press any key to close this launcher console (workers will keep running).
pause >nul