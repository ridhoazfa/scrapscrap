@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (bulgaria Part 1)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker bulgaria-pt1 [Sofia]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=bulgaria&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Sofia&& set SCRAPER_LOCALE=bg&& set SCRAPER_RUN_ID=bulgaria-pt1-w1&& call run-core.bat"
start "ScrapScrapWorker bulgaria-pt1 [Plovdiv]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=bulgaria&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Plovdiv&& set SCRAPER_LOCALE=bg&& set SCRAPER_RUN_ID=bulgaria-pt1-w2&& call run-core.bat"
start "ScrapScrapWorker bulgaria-pt1 [Varna]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=bulgaria&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Varna&& set SCRAPER_LOCALE=bg&& set SCRAPER_RUN_ID=bulgaria-pt1-w3&& call run-core.bat"
start "ScrapScrapWorker bulgaria-pt1 [Burgas]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=bulgaria&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Burgas&& set SCRAPER_LOCALE=bg&& set SCRAPER_RUN_ID=bulgaria-pt1-w4&& call run-core.bat"
start "ScrapScrapWorker bulgaria-pt1 [Ruse]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=bulgaria&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Ruse&& set SCRAPER_LOCALE=bg&& set SCRAPER_RUN_ID=bulgaria-pt1-w5&& call run-core.bat"
start "ScrapScrapWorker bulgaria-pt1 [Stara Zagora]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=bulgaria&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Stara Zagora&& set SCRAPER_LOCALE=bg&& set SCRAPER_RUN_ID=bulgaria-pt1-w6&& call run-core.bat"
start "ScrapScrapWorker bulgaria-pt1 [Pleven]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=bulgaria&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Pleven&& set SCRAPER_LOCALE=bg&& set SCRAPER_RUN_ID=bulgaria-pt1-w7&& call run-core.bat"
start "ScrapScrapWorker bulgaria-pt1 [Sliven]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=bulgaria&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Sliven&& set SCRAPER_LOCALE=bg&& set SCRAPER_RUN_ID=bulgaria-pt1-w8&& call run-core.bat"
start "ScrapScrapWorker bulgaria-pt1 [Dobrich]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=bulgaria&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Dobrich&& set SCRAPER_LOCALE=bg&& set SCRAPER_RUN_ID=bulgaria-pt1-w9&& call run-core.bat"
start "ScrapScrapWorker bulgaria-pt1 [Shumen]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=bulgaria&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Shumen&& set SCRAPER_LOCALE=bg&& set SCRAPER_RUN_ID=bulgaria-pt1-w10&& call run-core.bat"

echo Launched 10 worker(s) for bulgaria-pt1.
echo Press any key to close this launcher console (workers will keep running).
pause >nul