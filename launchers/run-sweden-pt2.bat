@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (sweden Part 2)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker sweden-pt2 [Lund]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=sweden&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Lund&& set SCRAPER_LOCALE=sv&& set SCRAPER_RUN_ID=sweden-pt2-w1&& call run-core.bat"
start "ScrapScrapWorker sweden-pt2 [Umea]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=sweden&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Umea&& set SCRAPER_LOCALE=sv&& set SCRAPER_RUN_ID=sweden-pt2-w2&& call run-core.bat"
start "ScrapScrapWorker sweden-pt2 [Gavle]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=sweden&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Gavle&& set SCRAPER_LOCALE=sv&& set SCRAPER_RUN_ID=sweden-pt2-w3&& call run-core.bat"
start "ScrapScrapWorker sweden-pt2 [Boras]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=sweden&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Boras&& set SCRAPER_LOCALE=sv&& set SCRAPER_RUN_ID=sweden-pt2-w4&& call run-core.bat"
start "ScrapScrapWorker sweden-pt2 [Sodertalje]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=sweden&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Sodertalje&& set SCRAPER_LOCALE=sv&& set SCRAPER_RUN_ID=sweden-pt2-w5&& call run-core.bat"
start "ScrapScrapWorker sweden-pt2 [Eskilstuna]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=sweden&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Eskilstuna&& set SCRAPER_LOCALE=sv&& set SCRAPER_RUN_ID=sweden-pt2-w6&& call run-core.bat"
start "ScrapScrapWorker sweden-pt2 [Halmstad]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=sweden&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Halmstad&& set SCRAPER_LOCALE=sv&& set SCRAPER_RUN_ID=sweden-pt2-w7&& call run-core.bat"
start "ScrapScrapWorker sweden-pt2 [Vaxjo]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=sweden&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Vaxjo&& set SCRAPER_LOCALE=sv&& set SCRAPER_RUN_ID=sweden-pt2-w8&& call run-core.bat"
start "ScrapScrapWorker sweden-pt2 [Karlstad]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=sweden&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Karlstad&& set SCRAPER_LOCALE=sv&& set SCRAPER_RUN_ID=sweden-pt2-w9&& call run-core.bat"
start "ScrapScrapWorker sweden-pt2 [Sundsvall]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=sweden&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Sundsvall&& set SCRAPER_LOCALE=sv&& set SCRAPER_RUN_ID=sweden-pt2-w10&& call run-core.bat"

echo Launched 10 worker(s) for sweden-pt2.
echo Press any key to close this launcher console (workers will keep running).
pause >nul