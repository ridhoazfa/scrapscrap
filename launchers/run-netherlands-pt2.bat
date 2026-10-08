@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (netherlands Part 2)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker netherlands-pt2 [Enschede]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=netherlands&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Enschede&& set SCRAPER_LOCALE=nl&& set SCRAPER_RUN_ID=netherlands-pt2-w1&& call run-core.bat"
start "ScrapScrapWorker netherlands-pt2 [Haarlem]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=netherlands&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Haarlem&& set SCRAPER_LOCALE=nl&& set SCRAPER_RUN_ID=netherlands-pt2-w2&& call run-core.bat"
start "ScrapScrapWorker netherlands-pt2 [Arnhem]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=netherlands&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Arnhem&& set SCRAPER_LOCALE=nl&& set SCRAPER_RUN_ID=netherlands-pt2-w3&& call run-core.bat"
start "ScrapScrapWorker netherlands-pt2 [Zaanstad]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=netherlands&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Zaanstad&& set SCRAPER_LOCALE=nl&& set SCRAPER_RUN_ID=netherlands-pt2-w4&& call run-core.bat"
start "ScrapScrapWorker netherlands-pt2 [Amersfoort]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=netherlands&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Amersfoort&& set SCRAPER_LOCALE=nl&& set SCRAPER_RUN_ID=netherlands-pt2-w5&& call run-core.bat"
start "ScrapScrapWorker netherlands-pt2 [Apeldoorn]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=netherlands&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Apeldoorn&& set SCRAPER_LOCALE=nl&& set SCRAPER_RUN_ID=netherlands-pt2-w6&& call run-core.bat"
start "ScrapScrapWorker netherlands-pt2 [s-Hertogenbosch]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=netherlands&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=s-Hertogenbosch&& set SCRAPER_LOCALE=nl&& set SCRAPER_RUN_ID=netherlands-pt2-w7&& call run-core.bat"
start "ScrapScrapWorker netherlands-pt2 [Hoofddorp]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=netherlands&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Hoofddorp&& set SCRAPER_LOCALE=nl&& set SCRAPER_RUN_ID=netherlands-pt2-w8&& call run-core.bat"
start "ScrapScrapWorker netherlands-pt2 [Maastricht]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=netherlands&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Maastricht&& set SCRAPER_LOCALE=nl&& set SCRAPER_RUN_ID=netherlands-pt2-w9&& call run-core.bat"
start "ScrapScrapWorker netherlands-pt2 [Dordrecht]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=netherlands&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Dordrecht&& set SCRAPER_LOCALE=nl&& set SCRAPER_RUN_ID=netherlands-pt2-w10&& call run-core.bat"

echo Launched 10 worker(s) for netherlands-pt2.
echo Press any key to close this launcher console (workers will keep running).
pause >nul