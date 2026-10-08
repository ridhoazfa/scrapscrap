@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (portugal Part 1)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker portugal-pt1 [Lisbon]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=portugal&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Lisbon&& set SCRAPER_LOCALE=pt&& set SCRAPER_RUN_ID=portugal-pt1-w1&& call run-core.bat"
start "ScrapScrapWorker portugal-pt1 [Porto]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=portugal&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Porto&& set SCRAPER_LOCALE=pt&& set SCRAPER_RUN_ID=portugal-pt1-w2&& call run-core.bat"
start "ScrapScrapWorker portugal-pt1 [Vila Nova de Gaia]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=portugal&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Vila Nova de Gaia&& set SCRAPER_LOCALE=pt&& set SCRAPER_RUN_ID=portugal-pt1-w3&& call run-core.bat"
start "ScrapScrapWorker portugal-pt1 [Amadora]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=portugal&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Amadora&& set SCRAPER_LOCALE=pt&& set SCRAPER_RUN_ID=portugal-pt1-w4&& call run-core.bat"
start "ScrapScrapWorker portugal-pt1 [Braga]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=portugal&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Braga&& set SCRAPER_LOCALE=pt&& set SCRAPER_RUN_ID=portugal-pt1-w5&& call run-core.bat"
start "ScrapScrapWorker portugal-pt1 [Funchal]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=portugal&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Funchal&& set SCRAPER_LOCALE=pt&& set SCRAPER_RUN_ID=portugal-pt1-w6&& call run-core.bat"
start "ScrapScrapWorker portugal-pt1 [Coimbra]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=portugal&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Coimbra&& set SCRAPER_LOCALE=pt&& set SCRAPER_RUN_ID=portugal-pt1-w7&& call run-core.bat"
start "ScrapScrapWorker portugal-pt1 [Setubal]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=portugal&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Setubal&& set SCRAPER_LOCALE=pt&& set SCRAPER_RUN_ID=portugal-pt1-w8&& call run-core.bat"
start "ScrapScrapWorker portugal-pt1 [Almada]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=portugal&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Almada&& set SCRAPER_LOCALE=pt&& set SCRAPER_RUN_ID=portugal-pt1-w9&& call run-core.bat"
start "ScrapScrapWorker portugal-pt1 [Agualva-Cacem]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=portugal&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Agualva-Cacem&& set SCRAPER_LOCALE=pt&& set SCRAPER_RUN_ID=portugal-pt1-w10&& call run-core.bat"

echo Launched 10 worker(s) for portugal-pt1.
echo Press any key to close this launcher console (workers will keep running).
pause >nul