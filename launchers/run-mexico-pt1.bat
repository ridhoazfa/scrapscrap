@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (mexico Part 1)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker mexico-pt1 [Mexico City]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=mexico&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Mexico City&& set SCRAPER_LOCALE=es&& set SCRAPER_RUN_ID=mexico-pt1-w1&& call run-core.bat"
start "ScrapScrapWorker mexico-pt1 [Guadalajara]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=mexico&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Guadalajara&& set SCRAPER_LOCALE=es&& set SCRAPER_RUN_ID=mexico-pt1-w2&& call run-core.bat"
start "ScrapScrapWorker mexico-pt1 [Monterrey]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=mexico&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Monterrey&& set SCRAPER_LOCALE=es&& set SCRAPER_RUN_ID=mexico-pt1-w3&& call run-core.bat"
start "ScrapScrapWorker mexico-pt1 [Puebla]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=mexico&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Puebla&& set SCRAPER_LOCALE=es&& set SCRAPER_RUN_ID=mexico-pt1-w4&& call run-core.bat"
start "ScrapScrapWorker mexico-pt1 [Tijuana]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=mexico&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Tijuana&& set SCRAPER_LOCALE=es&& set SCRAPER_RUN_ID=mexico-pt1-w5&& call run-core.bat"
start "ScrapScrapWorker mexico-pt1 [Leon]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=mexico&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Leon&& set SCRAPER_LOCALE=es&& set SCRAPER_RUN_ID=mexico-pt1-w6&& call run-core.bat"
start "ScrapScrapWorker mexico-pt1 [Merida]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=mexico&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Merida&& set SCRAPER_LOCALE=es&& set SCRAPER_RUN_ID=mexico-pt1-w7&& call run-core.bat"
start "ScrapScrapWorker mexico-pt1 [Cancun]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=mexico&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Cancun&& set SCRAPER_LOCALE=es&& set SCRAPER_RUN_ID=mexico-pt1-w8&& call run-core.bat"
start "ScrapScrapWorker mexico-pt1 [Queretaro]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=mexico&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Queretaro&& set SCRAPER_LOCALE=es&& set SCRAPER_RUN_ID=mexico-pt1-w9&& call run-core.bat"
start "ScrapScrapWorker mexico-pt1 [San Luis Potosi]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=mexico&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=San Luis Potosi&& set SCRAPER_LOCALE=es&& set SCRAPER_RUN_ID=mexico-pt1-w10&& call run-core.bat"

echo Launched 10 worker(s) for mexico-pt1.
echo Press any key to close this launcher console (workers will keep running).
pause >nul