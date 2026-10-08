@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (portugal Part 2)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker portugal-pt2 [Queluz]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=portugal&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Queluz&& set SCRAPER_LOCALE=pt&& set SCRAPER_RUN_ID=portugal-pt2-w1&& call run-core.bat"
start "ScrapScrapWorker portugal-pt2 [Rio Tinto]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=portugal&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Rio Tinto&& set SCRAPER_LOCALE=pt&& set SCRAPER_RUN_ID=portugal-pt2-w2&& call run-core.bat"
start "ScrapScrapWorker portugal-pt2 [Barreiro]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=portugal&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Barreiro&& set SCRAPER_LOCALE=pt&& set SCRAPER_RUN_ID=portugal-pt2-w3&& call run-core.bat"
start "ScrapScrapWorker portugal-pt2 [Aveiro]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=portugal&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Aveiro&& set SCRAPER_LOCALE=pt&& set SCRAPER_RUN_ID=portugal-pt2-w4&& call run-core.bat"
start "ScrapScrapWorker portugal-pt2 [Viseu]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=portugal&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Viseu&& set SCRAPER_LOCALE=pt&& set SCRAPER_RUN_ID=portugal-pt2-w5&& call run-core.bat"
start "ScrapScrapWorker portugal-pt2 [Leiria]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=portugal&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Leiria&& set SCRAPER_LOCALE=pt&& set SCRAPER_RUN_ID=portugal-pt2-w6&& call run-core.bat"
start "ScrapScrapWorker portugal-pt2 [Guimaraes]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=portugal&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Guimaraes&& set SCRAPER_LOCALE=pt&& set SCRAPER_RUN_ID=portugal-pt2-w7&& call run-core.bat"
start "ScrapScrapWorker portugal-pt2 [Faro]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=portugal&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Faro&& set SCRAPER_LOCALE=pt&& set SCRAPER_RUN_ID=portugal-pt2-w8&& call run-core.bat"
start "ScrapScrapWorker portugal-pt2 [Evora]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=portugal&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Evora&& set SCRAPER_LOCALE=pt&& set SCRAPER_RUN_ID=portugal-pt2-w9&& call run-core.bat"
start "ScrapScrapWorker portugal-pt2 [Ponta Delgada]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=portugal&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Ponta Delgada&& set SCRAPER_LOCALE=pt&& set SCRAPER_RUN_ID=portugal-pt2-w10&& call run-core.bat"

echo Launched 10 worker(s) for portugal-pt2.
echo Press any key to close this launcher console (workers will keep running).
pause >nul