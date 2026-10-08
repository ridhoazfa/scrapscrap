@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (sweden Part 1)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker sweden-pt1 [Stockholm]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=sweden&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Stockholm&& set SCRAPER_LOCALE=sv&& set SCRAPER_RUN_ID=sweden-pt1-w1&& call run-core.bat"
start "ScrapScrapWorker sweden-pt1 [Gothenburg]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=sweden&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Gothenburg&& set SCRAPER_LOCALE=sv&& set SCRAPER_RUN_ID=sweden-pt1-w2&& call run-core.bat"
start "ScrapScrapWorker sweden-pt1 [Malmo]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=sweden&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Malmo&& set SCRAPER_LOCALE=sv&& set SCRAPER_RUN_ID=sweden-pt1-w3&& call run-core.bat"
start "ScrapScrapWorker sweden-pt1 [Uppsala]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=sweden&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Uppsala&& set SCRAPER_LOCALE=sv&& set SCRAPER_RUN_ID=sweden-pt1-w4&& call run-core.bat"
start "ScrapScrapWorker sweden-pt1 [Vasteras]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=sweden&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Vasteras&& set SCRAPER_LOCALE=sv&& set SCRAPER_RUN_ID=sweden-pt1-w5&& call run-core.bat"
start "ScrapScrapWorker sweden-pt1 [Orebro]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=sweden&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Orebro&& set SCRAPER_LOCALE=sv&& set SCRAPER_RUN_ID=sweden-pt1-w6&& call run-core.bat"
start "ScrapScrapWorker sweden-pt1 [Linkoping]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=sweden&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Linkoping&& set SCRAPER_LOCALE=sv&& set SCRAPER_RUN_ID=sweden-pt1-w7&& call run-core.bat"
start "ScrapScrapWorker sweden-pt1 [Helsingborg]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=sweden&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Helsingborg&& set SCRAPER_LOCALE=sv&& set SCRAPER_RUN_ID=sweden-pt1-w8&& call run-core.bat"
start "ScrapScrapWorker sweden-pt1 [Jonkoping]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=sweden&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Jonkoping&& set SCRAPER_LOCALE=sv&& set SCRAPER_RUN_ID=sweden-pt1-w9&& call run-core.bat"
start "ScrapScrapWorker sweden-pt1 [Norrkoping]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=sweden&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Norrkoping&& set SCRAPER_LOCALE=sv&& set SCRAPER_RUN_ID=sweden-pt1-w10&& call run-core.bat"

echo Launched 10 worker(s) for sweden-pt1.
echo Press any key to close this launcher console (workers will keep running).
pause >nul