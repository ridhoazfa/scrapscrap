@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (new-zealand Part 1)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker new-zealand-pt1 [Auckland]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=new-zealand&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Auckland&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=new-zealand-pt1-w1&& call run-core.bat"
start "ScrapScrapWorker new-zealand-pt1 [Wellington]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=new-zealand&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Wellington&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=new-zealand-pt1-w2&& call run-core.bat"
start "ScrapScrapWorker new-zealand-pt1 [Christchurch]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=new-zealand&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Christchurch&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=new-zealand-pt1-w3&& call run-core.bat"
start "ScrapScrapWorker new-zealand-pt1 [Hamilton]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=new-zealand&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Hamilton&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=new-zealand-pt1-w4&& call run-core.bat"
start "ScrapScrapWorker new-zealand-pt1 [Tauranga]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=new-zealand&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Tauranga&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=new-zealand-pt1-w5&& call run-core.bat"
start "ScrapScrapWorker new-zealand-pt1 [Dunedin]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=new-zealand&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Dunedin&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=new-zealand-pt1-w6&& call run-core.bat"
start "ScrapScrapWorker new-zealand-pt1 [Palmerston North]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=new-zealand&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Palmerston North&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=new-zealand-pt1-w7&& call run-core.bat"
start "ScrapScrapWorker new-zealand-pt1 [Napier]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=new-zealand&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Napier&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=new-zealand-pt1-w8&& call run-core.bat"
start "ScrapScrapWorker new-zealand-pt1 [Nelson]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=new-zealand&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Nelson&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=new-zealand-pt1-w9&& call run-core.bat"
start "ScrapScrapWorker new-zealand-pt1 [Rotorua]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=new-zealand&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Rotorua&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=new-zealand-pt1-w10&& call run-core.bat"

echo Launched 10 worker(s) for new-zealand-pt1.
echo Press any key to close this launcher console (workers will keep running).
pause >nul