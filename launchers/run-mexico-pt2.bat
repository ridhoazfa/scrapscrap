@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (mexico Part 2)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker mexico-pt2 [Toluca]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=mexico&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Toluca&& set SCRAPER_LOCALE=es&& set SCRAPER_RUN_ID=mexico-pt2-w1&& call run-core.bat"
start "ScrapScrapWorker mexico-pt2 [Hermosillo]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=mexico&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Hermosillo&& set SCRAPER_LOCALE=es&& set SCRAPER_RUN_ID=mexico-pt2-w2&& call run-core.bat"
start "ScrapScrapWorker mexico-pt2 [Juarez]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=mexico&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Juarez&& set SCRAPER_LOCALE=es&& set SCRAPER_RUN_ID=mexico-pt2-w3&& call run-core.bat"
start "ScrapScrapWorker mexico-pt2 [Veracruz]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=mexico&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Veracruz&& set SCRAPER_LOCALE=es&& set SCRAPER_RUN_ID=mexico-pt2-w4&& call run-core.bat"
start "ScrapScrapWorker mexico-pt2 [Saltillo]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=mexico&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Saltillo&& set SCRAPER_LOCALE=es&& set SCRAPER_RUN_ID=mexico-pt2-w5&& call run-core.bat"
start "ScrapScrapWorker mexico-pt2 [Aguascalientes]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=mexico&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Aguascalientes&& set SCRAPER_LOCALE=es&& set SCRAPER_RUN_ID=mexico-pt2-w6&& call run-core.bat"
start "ScrapScrapWorker mexico-pt2 [Cofor]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=mexico&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Cofor&& set SCRAPER_LOCALE=es&& set SCRAPER_RUN_ID=mexico-pt2-w7&& call run-core.bat"
start "ScrapScrapWorker mexico-pt2 [Villahermosa]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=mexico&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Villahermosa&& set SCRAPER_LOCALE=es&& set SCRAPER_RUN_ID=mexico-pt2-w8&& call run-core.bat"
start "ScrapScrapWorker mexico-pt2 [Culiacan]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=mexico&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Culiacan&& set SCRAPER_LOCALE=es&& set SCRAPER_RUN_ID=mexico-pt2-w9&& call run-core.bat"
start "ScrapScrapWorker mexico-pt2 [Mexicali]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=mexico&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Mexicali&& set SCRAPER_LOCALE=es&& set SCRAPER_RUN_ID=mexico-pt2-w10&& call run-core.bat"

echo Launched 10 worker(s) for mexico-pt2.
echo Press any key to close this launcher console (workers will keep running).
pause >nul