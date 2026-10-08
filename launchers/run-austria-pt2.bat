@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (austria Part 2)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker austria-pt2 [Wiener Neustadt]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=austria&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Wiener Neustadt&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=austria-pt2-w1&& call run-core.bat"
start "ScrapScrapWorker austria-pt2 [Steyr]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=austria&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Steyr&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=austria-pt2-w2&& call run-core.bat"
start "ScrapScrapWorker austria-pt2 [Feldkirch]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=austria&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Feldkirch&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=austria-pt2-w3&& call run-core.bat"
start "ScrapScrapWorker austria-pt2 [Bregenz]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=austria&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Bregenz&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=austria-pt2-w4&& call run-core.bat"
start "ScrapScrapWorker austria-pt2 [Leonding]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=austria&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Leonding&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=austria-pt2-w5&& call run-core.bat"
start "ScrapScrapWorker austria-pt2 [Klosterneuburg]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=austria&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Klosterneuburg&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=austria-pt2-w6&& call run-core.bat"
start "ScrapScrapWorker austria-pt2 [Baden]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=austria&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Baden&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=austria-pt2-w7&& call run-core.bat"
start "ScrapScrapWorker austria-pt2 [Wolfsberg]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=austria&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Wolfsberg&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=austria-pt2-w8&& call run-core.bat"
start "ScrapScrapWorker austria-pt2 [Leoben]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=austria&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Leoben&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=austria-pt2-w9&& call run-core.bat"
start "ScrapScrapWorker austria-pt2 [Krems an der Donau]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=austria&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Krems an der Donau&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=austria-pt2-w10&& call run-core.bat"

echo Launched 10 worker(s) for austria-pt2.
echo Press any key to close this launcher console (workers will keep running).
pause >nul