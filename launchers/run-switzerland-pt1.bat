@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (switzerland Part 1)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker switzerland-pt1 [Zurich]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=switzerland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Zurich&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=switzerland-pt1-w1&& call run-core.bat"
start "ScrapScrapWorker switzerland-pt1 [Geneva]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=switzerland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Geneva&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=switzerland-pt1-w2&& call run-core.bat"
start "ScrapScrapWorker switzerland-pt1 [Basel]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=switzerland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Basel&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=switzerland-pt1-w3&& call run-core.bat"
start "ScrapScrapWorker switzerland-pt1 [Lausanne]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=switzerland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Lausanne&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=switzerland-pt1-w4&& call run-core.bat"
start "ScrapScrapWorker switzerland-pt1 [Bern]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=switzerland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Bern&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=switzerland-pt1-w5&& call run-core.bat"
start "ScrapScrapWorker switzerland-pt1 [Winterthur]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=switzerland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Winterthur&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=switzerland-pt1-w6&& call run-core.bat"
start "ScrapScrapWorker switzerland-pt1 [Lucerne]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=switzerland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Lucerne&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=switzerland-pt1-w7&& call run-core.bat"
start "ScrapScrapWorker switzerland-pt1 [St. Gallen]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=switzerland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=St. Gallen&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=switzerland-pt1-w8&& call run-core.bat"
start "ScrapScrapWorker switzerland-pt1 [Lugano]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=switzerland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Lugano&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=switzerland-pt1-w9&& call run-core.bat"
start "ScrapScrapWorker switzerland-pt1 [Biel]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=switzerland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Biel&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=switzerland-pt1-w10&& call run-core.bat"

echo Launched 10 worker(s) for switzerland-pt1.
echo Press any key to close this launcher console (workers will keep running).
pause >nul