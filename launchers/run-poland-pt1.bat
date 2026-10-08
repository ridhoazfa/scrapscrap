@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (poland Part 1)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker poland-pt1 [Warsaw]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=poland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Warsaw&& set SCRAPER_LOCALE=pl&& set SCRAPER_RUN_ID=poland-pt1-w1&& call run-core.bat"
start "ScrapScrapWorker poland-pt1 [Krakow]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=poland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Krakow&& set SCRAPER_LOCALE=pl&& set SCRAPER_RUN_ID=poland-pt1-w2&& call run-core.bat"
start "ScrapScrapWorker poland-pt1 [Lodz]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=poland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Lodz&& set SCRAPER_LOCALE=pl&& set SCRAPER_RUN_ID=poland-pt1-w3&& call run-core.bat"
start "ScrapScrapWorker poland-pt1 [Wroclaw]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=poland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Wroclaw&& set SCRAPER_LOCALE=pl&& set SCRAPER_RUN_ID=poland-pt1-w4&& call run-core.bat"
start "ScrapScrapWorker poland-pt1 [Poznan]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=poland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Poznan&& set SCRAPER_LOCALE=pl&& set SCRAPER_RUN_ID=poland-pt1-w5&& call run-core.bat"
start "ScrapScrapWorker poland-pt1 [Gdansk]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=poland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Gdansk&& set SCRAPER_LOCALE=pl&& set SCRAPER_RUN_ID=poland-pt1-w6&& call run-core.bat"
start "ScrapScrapWorker poland-pt1 [Szczecin]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=poland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Szczecin&& set SCRAPER_LOCALE=pl&& set SCRAPER_RUN_ID=poland-pt1-w7&& call run-core.bat"
start "ScrapScrapWorker poland-pt1 [Bydgoszcz]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=poland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Bydgoszcz&& set SCRAPER_LOCALE=pl&& set SCRAPER_RUN_ID=poland-pt1-w8&& call run-core.bat"
start "ScrapScrapWorker poland-pt1 [Lublin]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=poland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Lublin&& set SCRAPER_LOCALE=pl&& set SCRAPER_RUN_ID=poland-pt1-w9&& call run-core.bat"
start "ScrapScrapWorker poland-pt1 [Katowice]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=poland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Katowice&& set SCRAPER_LOCALE=pl&& set SCRAPER_RUN_ID=poland-pt1-w10&& call run-core.bat"

echo Launched 10 worker(s) for poland-pt1.
echo Press any key to close this launcher console (workers will keep running).
pause >nul