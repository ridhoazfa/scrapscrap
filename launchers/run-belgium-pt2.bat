@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (belgium Part 2)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker belgium-pt2 [Mechelen]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=belgium&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Mechelen&& set SCRAPER_LOCALE=nl&& set SCRAPER_RUN_ID=belgium-pt2-w1&& call run-core.bat"
start "ScrapScrapWorker belgium-pt2 [La Louviere]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=belgium&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=La Louviere&& set SCRAPER_LOCALE=nl&& set SCRAPER_RUN_ID=belgium-pt2-w2&& call run-core.bat"
start "ScrapScrapWorker belgium-pt2 [Hasselt]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=belgium&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Hasselt&& set SCRAPER_LOCALE=nl&& set SCRAPER_RUN_ID=belgium-pt2-w3&& call run-core.bat"
start "ScrapScrapWorker belgium-pt2 [Sint-Niklaas]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=belgium&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Sint-Niklaas&& set SCRAPER_LOCALE=nl&& set SCRAPER_RUN_ID=belgium-pt2-w4&& call run-core.bat"
start "ScrapScrapWorker belgium-pt2 [Kortrijk]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=belgium&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Kortrijk&& set SCRAPER_LOCALE=nl&& set SCRAPER_RUN_ID=belgium-pt2-w5&& call run-core.bat"
start "ScrapScrapWorker belgium-pt2 [Ostend]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=belgium&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Ostend&& set SCRAPER_LOCALE=nl&& set SCRAPER_RUN_ID=belgium-pt2-w6&& call run-core.bat"
start "ScrapScrapWorker belgium-pt2 [Tournai]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=belgium&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Tournai&& set SCRAPER_LOCALE=nl&& set SCRAPER_RUN_ID=belgium-pt2-w7&& call run-core.bat"
start "ScrapScrapWorker belgium-pt2 [Genk]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=belgium&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Genk&& set SCRAPER_LOCALE=nl&& set SCRAPER_RUN_ID=belgium-pt2-w8&& call run-core.bat"
start "ScrapScrapWorker belgium-pt2 [Seraing]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=belgium&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Seraing&& set SCRAPER_LOCALE=nl&& set SCRAPER_RUN_ID=belgium-pt2-w9&& call run-core.bat"
start "ScrapScrapWorker belgium-pt2 [Roeselare]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=belgium&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Roeselare&& set SCRAPER_LOCALE=nl&& set SCRAPER_RUN_ID=belgium-pt2-w10&& call run-core.bat"

echo Launched 10 worker(s) for belgium-pt2.
echo Press any key to close this launcher console (workers will keep running).
pause >nul