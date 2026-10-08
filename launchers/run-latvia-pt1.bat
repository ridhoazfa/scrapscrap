@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (latvia Part 1)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker latvia-pt1 [Riga]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=latvia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Riga&& set SCRAPER_LOCALE=lv&& set SCRAPER_RUN_ID=latvia-pt1-w1&& call run-core.bat"
start "ScrapScrapWorker latvia-pt1 [Daugavpils]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=latvia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Daugavpils&& set SCRAPER_LOCALE=lv&& set SCRAPER_RUN_ID=latvia-pt1-w2&& call run-core.bat"
start "ScrapScrapWorker latvia-pt1 [Liepaja]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=latvia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Liepaja&& set SCRAPER_LOCALE=lv&& set SCRAPER_RUN_ID=latvia-pt1-w3&& call run-core.bat"
start "ScrapScrapWorker latvia-pt1 [Jelgava]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=latvia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Jelgava&& set SCRAPER_LOCALE=lv&& set SCRAPER_RUN_ID=latvia-pt1-w4&& call run-core.bat"
start "ScrapScrapWorker latvia-pt1 [Jurmala]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=latvia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Jurmala&& set SCRAPER_LOCALE=lv&& set SCRAPER_RUN_ID=latvia-pt1-w5&& call run-core.bat"
start "ScrapScrapWorker latvia-pt1 [Ventspils]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=latvia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Ventspils&& set SCRAPER_LOCALE=lv&& set SCRAPER_RUN_ID=latvia-pt1-w6&& call run-core.bat"
start "ScrapScrapWorker latvia-pt1 [Rezekne]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=latvia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Rezekne&& set SCRAPER_LOCALE=lv&& set SCRAPER_RUN_ID=latvia-pt1-w7&& call run-core.bat"
start "ScrapScrapWorker latvia-pt1 [Valmiera]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=latvia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Valmiera&& set SCRAPER_LOCALE=lv&& set SCRAPER_RUN_ID=latvia-pt1-w8&& call run-core.bat"
start "ScrapScrapWorker latvia-pt1 [Jekabpils]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=latvia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Jekabpils&& set SCRAPER_LOCALE=lv&& set SCRAPER_RUN_ID=latvia-pt1-w9&& call run-core.bat"
start "ScrapScrapWorker latvia-pt1 [Ogre]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=latvia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Ogre&& set SCRAPER_LOCALE=lv&& set SCRAPER_RUN_ID=latvia-pt1-w10&& call run-core.bat"

echo Launched 10 worker(s) for latvia-pt1.
echo Press any key to close this launcher console (workers will keep running).
pause >nul