@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (south-africa Part 1)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker south-africa-pt1 [Johannesburg]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=south-africa&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Johannesburg&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=south-africa-pt1-w1&& call run-core.bat"
start "ScrapScrapWorker south-africa-pt1 [Cape Town]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=south-africa&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Cape Town&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=south-africa-pt1-w2&& call run-core.bat"
start "ScrapScrapWorker south-africa-pt1 [Durban]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=south-africa&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Durban&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=south-africa-pt1-w3&& call run-core.bat"
start "ScrapScrapWorker south-africa-pt1 [Pretoria]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=south-africa&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Pretoria&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=south-africa-pt1-w4&& call run-core.bat"
start "ScrapScrapWorker south-africa-pt1 [Gqeberha]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=south-africa&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Gqeberha&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=south-africa-pt1-w5&& call run-core.bat"
start "ScrapScrapWorker south-africa-pt1 [Bloemfontein]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=south-africa&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Bloemfontein&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=south-africa-pt1-w6&& call run-core.bat"
start "ScrapScrapWorker south-africa-pt1 [East London]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=south-africa&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=East London&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=south-africa-pt1-w7&& call run-core.bat"
start "ScrapScrapWorker south-africa-pt1 [Polokwane]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=south-africa&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Polokwane&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=south-africa-pt1-w8&& call run-core.bat"
start "ScrapScrapWorker south-africa-pt1 [Nelspruit]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=south-africa&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Nelspruit&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=south-africa-pt1-w9&& call run-core.bat"
start "ScrapScrapWorker south-africa-pt1 [Sandton]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=south-africa&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Sandton&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=south-africa-pt1-w10&& call run-core.bat"

echo Launched 10 worker(s) for south-africa-pt1.
echo Press any key to close this launcher console (workers will keep running).
pause >nul