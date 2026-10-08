@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (hong-kong Part 1)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker hong-kong-pt1 [Hong Kong]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=hong-kong&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Hong Kong&& set SCRAPER_LOCALE=zh&& set SCRAPER_RUN_ID=hong-kong-pt1-w1&& call run-core.bat"
start "ScrapScrapWorker hong-kong-pt1 [Kowloon]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=hong-kong&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Kowloon&& set SCRAPER_LOCALE=zh&& set SCRAPER_RUN_ID=hong-kong-pt1-w2&& call run-core.bat"
start "ScrapScrapWorker hong-kong-pt1 [Shatin]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=hong-kong&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Shatin&& set SCRAPER_LOCALE=zh&& set SCRAPER_RUN_ID=hong-kong-pt1-w3&& call run-core.bat"
start "ScrapScrapWorker hong-kong-pt1 [Tuen Mun]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=hong-kong&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Tuen Mun&& set SCRAPER_LOCALE=zh&& set SCRAPER_RUN_ID=hong-kong-pt1-w4&& call run-core.bat"

echo Launched 4 worker(s) for hong-kong-pt1.
echo Press any key to close this launcher console (workers will keep running).
pause >nul