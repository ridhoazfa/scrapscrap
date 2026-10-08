@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (singapore Part 1)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker singapore-pt1 [Singapore]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=singapore&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Singapore&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=singapore-pt1-w1&& call run-core.bat"
start "ScrapScrapWorker singapore-pt1 [Jurong]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=singapore&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Jurong&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=singapore-pt1-w2&& call run-core.bat"
start "ScrapScrapWorker singapore-pt1 [Tampines]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=singapore&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Tampines&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=singapore-pt1-w3&& call run-core.bat"
start "ScrapScrapWorker singapore-pt1 [Woodlands]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=singapore&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Woodlands&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=singapore-pt1-w4&& call run-core.bat"
start "ScrapScrapWorker singapore-pt1 [Yishun]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=singapore&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Yishun&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=singapore-pt1-w5&& call run-core.bat"

echo Launched 5 worker(s) for singapore-pt1.
echo Press any key to close this launcher console (workers will keep running).
pause >nul