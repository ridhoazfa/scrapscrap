@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (germany Part 2)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker germany-pt2 [Bremen]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=germany&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Bremen&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=germany-pt2-w1&& call run-core.bat"
start "ScrapScrapWorker germany-pt2 [Dresden]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=germany&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Dresden&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=germany-pt2-w2&& call run-core.bat"
start "ScrapScrapWorker germany-pt2 [Hannover]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=germany&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Hannover&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=germany-pt2-w3&& call run-core.bat"
start "ScrapScrapWorker germany-pt2 [Nuremberg]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=germany&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Nuremberg&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=germany-pt2-w4&& call run-core.bat"
start "ScrapScrapWorker germany-pt2 [Duisburg]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=germany&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Duisburg&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=germany-pt2-w5&& call run-core.bat"
start "ScrapScrapWorker germany-pt2 [Bochum]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=germany&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Bochum&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=germany-pt2-w6&& call run-core.bat"
start "ScrapScrapWorker germany-pt2 [Wuppertal]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=germany&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Wuppertal&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=germany-pt2-w7&& call run-core.bat"
start "ScrapScrapWorker germany-pt2 [Bielefeld]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=germany&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Bielefeld&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=germany-pt2-w8&& call run-core.bat"
start "ScrapScrapWorker germany-pt2 [Bonn]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=germany&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Bonn&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=germany-pt2-w9&& call run-core.bat"
start "ScrapScrapWorker germany-pt2 [Munster]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=germany&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Munster&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=germany-pt2-w10&& call run-core.bat"

echo Launched 10 worker(s) for germany-pt2.
echo Press any key to close this launcher console (workers will keep running).
pause >nul