@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (poland Part 2)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker poland-pt2 [Bialystok]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=poland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Bialystok&& set SCRAPER_LOCALE=pl&& set SCRAPER_RUN_ID=poland-pt2-w1&& call run-core.bat"
start "ScrapScrapWorker poland-pt2 [Gdynia]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=poland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Gdynia&& set SCRAPER_LOCALE=pl&& set SCRAPER_RUN_ID=poland-pt2-w2&& call run-core.bat"
start "ScrapScrapWorker poland-pt2 [Czestochowa]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=poland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Czestochowa&& set SCRAPER_LOCALE=pl&& set SCRAPER_RUN_ID=poland-pt2-w3&& call run-core.bat"
start "ScrapScrapWorker poland-pt2 [Radom]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=poland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Radom&& set SCRAPER_LOCALE=pl&& set SCRAPER_RUN_ID=poland-pt2-w4&& call run-core.bat"
start "ScrapScrapWorker poland-pt2 [Sosnowiec]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=poland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Sosnowiec&& set SCRAPER_LOCALE=pl&& set SCRAPER_RUN_ID=poland-pt2-w5&& call run-core.bat"
start "ScrapScrapWorker poland-pt2 [Torun]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=poland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Torun&& set SCRAPER_LOCALE=pl&& set SCRAPER_RUN_ID=poland-pt2-w6&& call run-core.bat"
start "ScrapScrapWorker poland-pt2 [Kielce]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=poland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Kielce&& set SCRAPER_LOCALE=pl&& set SCRAPER_RUN_ID=poland-pt2-w7&& call run-core.bat"
start "ScrapScrapWorker poland-pt2 [Rzeszow]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=poland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Rzeszow&& set SCRAPER_LOCALE=pl&& set SCRAPER_RUN_ID=poland-pt2-w8&& call run-core.bat"
start "ScrapScrapWorker poland-pt2 [Gliwice]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=poland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Gliwice&& set SCRAPER_LOCALE=pl&& set SCRAPER_RUN_ID=poland-pt2-w9&& call run-core.bat"
start "ScrapScrapWorker poland-pt2 [Zabrze]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=poland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Zabrze&& set SCRAPER_LOCALE=pl&& set SCRAPER_RUN_ID=poland-pt2-w10&& call run-core.bat"

echo Launched 10 worker(s) for poland-pt2.
echo Press any key to close this launcher console (workers will keep running).
pause >nul