@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (romania Part 2)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker romania-pt2 [Braila]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=romania&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Braila&& set SCRAPER_LOCALE=ro&& set SCRAPER_RUN_ID=romania-pt2-w1&& call run-core.bat"
start "ScrapScrapWorker romania-pt2 [Arad]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=romania&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Arad&& set SCRAPER_LOCALE=ro&& set SCRAPER_RUN_ID=romania-pt2-w2&& call run-core.bat"
start "ScrapScrapWorker romania-pt2 [Pitesti]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=romania&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Pitesti&& set SCRAPER_LOCALE=ro&& set SCRAPER_RUN_ID=romania-pt2-w3&& call run-core.bat"
start "ScrapScrapWorker romania-pt2 [Sibiu]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=romania&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Sibiu&& set SCRAPER_LOCALE=ro&& set SCRAPER_RUN_ID=romania-pt2-w4&& call run-core.bat"
start "ScrapScrapWorker romania-pt2 [Bacau]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=romania&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Bacau&& set SCRAPER_LOCALE=ro&& set SCRAPER_RUN_ID=romania-pt2-w5&& call run-core.bat"
start "ScrapScrapWorker romania-pt2 [Targu Mures]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=romania&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Targu Mures&& set SCRAPER_LOCALE=ro&& set SCRAPER_RUN_ID=romania-pt2-w6&& call run-core.bat"
start "ScrapScrapWorker romania-pt2 [Baia Mare]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=romania&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Baia Mare&& set SCRAPER_LOCALE=ro&& set SCRAPER_RUN_ID=romania-pt2-w7&& call run-core.bat"
start "ScrapScrapWorker romania-pt2 [Buzau]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=romania&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Buzau&& set SCRAPER_LOCALE=ro&& set SCRAPER_RUN_ID=romania-pt2-w8&& call run-core.bat"
start "ScrapScrapWorker romania-pt2 [Botosani]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=romania&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Botosani&& set SCRAPER_LOCALE=ro&& set SCRAPER_RUN_ID=romania-pt2-w9&& call run-core.bat"
start "ScrapScrapWorker romania-pt2 [Satu Mare]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=romania&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Satu Mare&& set SCRAPER_LOCALE=ro&& set SCRAPER_RUN_ID=romania-pt2-w10&& call run-core.bat"

echo Launched 10 worker(s) for romania-pt2.
echo Press any key to close this launcher console (workers will keep running).
pause >nul