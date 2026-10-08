@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (germany Part 1)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker germany-pt1 [Berlin]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=germany&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Berlin&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=germany-pt1-w1&& call run-core.bat"
start "ScrapScrapWorker germany-pt1 [Hamburg]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=germany&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Hamburg&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=germany-pt1-w2&& call run-core.bat"
start "ScrapScrapWorker germany-pt1 [Munich]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=germany&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Munich&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=germany-pt1-w3&& call run-core.bat"
start "ScrapScrapWorker germany-pt1 [Cologne]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=germany&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Cologne&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=germany-pt1-w4&& call run-core.bat"
start "ScrapScrapWorker germany-pt1 [Frankfurt]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=germany&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Frankfurt&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=germany-pt1-w5&& call run-core.bat"
start "ScrapScrapWorker germany-pt1 [Stuttgart]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=germany&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Stuttgart&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=germany-pt1-w6&& call run-core.bat"
start "ScrapScrapWorker germany-pt1 [Dusseldorf]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=germany&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Dusseldorf&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=germany-pt1-w7&& call run-core.bat"
start "ScrapScrapWorker germany-pt1 [Leipzig]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=germany&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Leipzig&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=germany-pt1-w8&& call run-core.bat"
start "ScrapScrapWorker germany-pt1 [Dortmund]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=germany&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Dortmund&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=germany-pt1-w9&& call run-core.bat"
start "ScrapScrapWorker germany-pt1 [Essen]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=germany&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Essen&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=germany-pt1-w10&& call run-core.bat"

echo Launched 10 worker(s) for germany-pt1.
echo Press any key to close this launcher console (workers will keep running).
pause >nul