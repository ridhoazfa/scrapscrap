@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (germany Part 3)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker germany-pt3 [Mannheim]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=germany&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Mannheim&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=germany-pt3-w1&& call run-core.bat"
start "ScrapScrapWorker germany-pt3 [Karlsruhe]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=germany&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Karlsruhe&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=germany-pt3-w2&& call run-core.bat"
start "ScrapScrapWorker germany-pt3 [Augsburg]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=germany&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Augsburg&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=germany-pt3-w3&& call run-core.bat"
start "ScrapScrapWorker germany-pt3 [Wiesbaden]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=germany&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Wiesbaden&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=germany-pt3-w4&& call run-core.bat"
start "ScrapScrapWorker germany-pt3 [Gelsenkirchen]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=germany&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Gelsenkirchen&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=germany-pt3-w5&& call run-core.bat"
start "ScrapScrapWorker germany-pt3 [Monchengladbach]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=germany&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Monchengladbach&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=germany-pt3-w6&& call run-core.bat"
start "ScrapScrapWorker germany-pt3 [Braunschweig]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=germany&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Braunschweig&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=germany-pt3-w7&& call run-core.bat"
start "ScrapScrapWorker germany-pt3 [Chemnitz]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=germany&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Chemnitz&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=germany-pt3-w8&& call run-core.bat"
start "ScrapScrapWorker germany-pt3 [Kiel]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=germany&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Kiel&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=germany-pt3-w9&& call run-core.bat"
start "ScrapScrapWorker germany-pt3 [Aachen]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=germany&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Aachen&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=germany-pt3-w10&& call run-core.bat"

echo Launched 10 worker(s) for germany-pt3.
echo Press any key to close this launcher console (workers will keep running).
pause >nul