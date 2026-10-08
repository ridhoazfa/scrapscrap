@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (nigeria Part 1)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker nigeria-pt1 [Lagos]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=nigeria&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Lagos&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=nigeria-pt1-w1&& call run-core.bat"
start "ScrapScrapWorker nigeria-pt1 [Abuja]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=nigeria&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Abuja&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=nigeria-pt1-w2&& call run-core.bat"
start "ScrapScrapWorker nigeria-pt1 [Port Harcourt]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=nigeria&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Port Harcourt&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=nigeria-pt1-w3&& call run-core.bat"
start "ScrapScrapWorker nigeria-pt1 [Kano]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=nigeria&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Kano&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=nigeria-pt1-w4&& call run-core.bat"
start "ScrapScrapWorker nigeria-pt1 [Ibadan]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=nigeria&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Ibadan&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=nigeria-pt1-w5&& call run-core.bat"
start "ScrapScrapWorker nigeria-pt1 [Benin City]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=nigeria&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Benin City&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=nigeria-pt1-w6&& call run-core.bat"
start "ScrapScrapWorker nigeria-pt1 [Kaduna]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=nigeria&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Kaduna&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=nigeria-pt1-w7&& call run-core.bat"
start "ScrapScrapWorker nigeria-pt1 [Enugu]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=nigeria&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Enugu&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=nigeria-pt1-w8&& call run-core.bat"
start "ScrapScrapWorker nigeria-pt1 [Owerri]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=nigeria&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Owerri&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=nigeria-pt1-w9&& call run-core.bat"
start "ScrapScrapWorker nigeria-pt1 [Onitsha]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=nigeria&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Onitsha&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=nigeria-pt1-w10&& call run-core.bat"

echo Launched 10 worker(s) for nigeria-pt1.
echo Press any key to close this launcher console (workers will keep running).
pause >nul