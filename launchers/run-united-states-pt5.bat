@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (united-states Part 5)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker united-states-pt5 [Honolulu]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-states&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Honolulu&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-states-pt5-w1&& call run-core.bat"
start "ScrapScrapWorker united-states-pt5 [Salt Lake City]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-states&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Salt Lake City&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-states-pt5-w2&& call run-core.bat"
start "ScrapScrapWorker united-states-pt5 [New Orleans]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-states&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=New Orleans&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-states-pt5-w3&& call run-core.bat"
start "ScrapScrapWorker united-states-pt5 [Minneapolis]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-states&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Minneapolis&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-states-pt5-w4&& call run-core.bat"
start "ScrapScrapWorker united-states-pt5 [Tampa]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-states&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Tampa&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-states-pt5-w5&& call run-core.bat"
start "ScrapScrapWorker united-states-pt5 [Orlando]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-states&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Orlando&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-states-pt5-w6&& call run-core.bat"
start "ScrapScrapWorker united-states-pt5 [Pittsburgh]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-states&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Pittsburgh&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-states-pt5-w7&& call run-core.bat"
start "ScrapScrapWorker united-states-pt5 [Cincinnati]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-states&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Cincinnati&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-states-pt5-w8&& call run-core.bat"
start "ScrapScrapWorker united-states-pt5 [Cleveland]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-states&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Cleveland&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-states-pt5-w9&& call run-core.bat"
start "ScrapScrapWorker united-states-pt5 [St. Louis]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=united-states&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=St. Louis&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=united-states-pt5-w10&& call run-core.bat"

echo Launched 10 worker(s) for united-states-pt5.
echo Press any key to close this launcher console (workers will keep running).
pause >nul