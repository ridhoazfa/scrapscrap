@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (kenya Part 1)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker kenya-pt1 [Nairobi]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=kenya&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Nairobi&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=kenya-pt1-w1&& call run-core.bat"
start "ScrapScrapWorker kenya-pt1 [Mombasa]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=kenya&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Mombasa&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=kenya-pt1-w2&& call run-core.bat"
start "ScrapScrapWorker kenya-pt1 [Kisumu]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=kenya&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Kisumu&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=kenya-pt1-w3&& call run-core.bat"
start "ScrapScrapWorker kenya-pt1 [Nakuru]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=kenya&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Nakuru&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=kenya-pt1-w4&& call run-core.bat"
start "ScrapScrapWorker kenya-pt1 [Eldoret]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=kenya&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Eldoret&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=kenya-pt1-w5&& call run-core.bat"
start "ScrapScrapWorker kenya-pt1 [Thika]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=kenya&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Thika&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=kenya-pt1-w6&& call run-core.bat"
start "ScrapScrapWorker kenya-pt1 [Malindi]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=kenya&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Malindi&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=kenya-pt1-w7&& call run-core.bat"
start "ScrapScrapWorker kenya-pt1 [Kitale]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=kenya&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Kitale&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=kenya-pt1-w8&& call run-core.bat"
start "ScrapScrapWorker kenya-pt1 [Garissa]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=kenya&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Garissa&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=kenya-pt1-w9&& call run-core.bat"
start "ScrapScrapWorker kenya-pt1 [Kakamega]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=kenya&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Kakamega&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=kenya-pt1-w10&& call run-core.bat"

echo Launched 10 worker(s) for kenya-pt1.
echo Press any key to close this launcher console (workers will keep running).
pause >nul