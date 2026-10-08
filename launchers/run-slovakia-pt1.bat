@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (slovakia Part 1)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker slovakia-pt1 [Bratislava]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=slovakia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Bratislava&& set SCRAPER_LOCALE=sk&& set SCRAPER_RUN_ID=slovakia-pt1-w1&& call run-core.bat"
start "ScrapScrapWorker slovakia-pt1 [Kosice]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=slovakia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Kosice&& set SCRAPER_LOCALE=sk&& set SCRAPER_RUN_ID=slovakia-pt1-w2&& call run-core.bat"
start "ScrapScrapWorker slovakia-pt1 [Presov]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=slovakia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Presov&& set SCRAPER_LOCALE=sk&& set SCRAPER_RUN_ID=slovakia-pt1-w3&& call run-core.bat"
start "ScrapScrapWorker slovakia-pt1 [Zilina]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=slovakia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Zilina&& set SCRAPER_LOCALE=sk&& set SCRAPER_RUN_ID=slovakia-pt1-w4&& call run-core.bat"
start "ScrapScrapWorker slovakia-pt1 [Nitra]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=slovakia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Nitra&& set SCRAPER_LOCALE=sk&& set SCRAPER_RUN_ID=slovakia-pt1-w5&& call run-core.bat"
start "ScrapScrapWorker slovakia-pt1 [Banska Bystrica]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=slovakia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Banska Bystrica&& set SCRAPER_LOCALE=sk&& set SCRAPER_RUN_ID=slovakia-pt1-w6&& call run-core.bat"
start "ScrapScrapWorker slovakia-pt1 [Trnava]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=slovakia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Trnava&& set SCRAPER_LOCALE=sk&& set SCRAPER_RUN_ID=slovakia-pt1-w7&& call run-core.bat"
start "ScrapScrapWorker slovakia-pt1 [Martin]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=slovakia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Martin&& set SCRAPER_LOCALE=sk&& set SCRAPER_RUN_ID=slovakia-pt1-w8&& call run-core.bat"
start "ScrapScrapWorker slovakia-pt1 [Trencin]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=slovakia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Trencin&& set SCRAPER_LOCALE=sk&& set SCRAPER_RUN_ID=slovakia-pt1-w9&& call run-core.bat"
start "ScrapScrapWorker slovakia-pt1 [Poprad]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=slovakia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Poprad&& set SCRAPER_LOCALE=sk&& set SCRAPER_RUN_ID=slovakia-pt1-w10&& call run-core.bat"

echo Launched 10 worker(s) for slovakia-pt1.
echo Press any key to close this launcher console (workers will keep running).
pause >nul