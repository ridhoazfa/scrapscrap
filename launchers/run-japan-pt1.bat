@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (japan Part 1)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker japan-pt1 [Tokyo]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=japan&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Tokyo&& set SCRAPER_LOCALE=ja&& set SCRAPER_RUN_ID=japan-pt1-w1&& call run-core.bat"
start "ScrapScrapWorker japan-pt1 [Yokohama]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=japan&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Yokohama&& set SCRAPER_LOCALE=ja&& set SCRAPER_RUN_ID=japan-pt1-w2&& call run-core.bat"
start "ScrapScrapWorker japan-pt1 [Osaka]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=japan&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Osaka&& set SCRAPER_LOCALE=ja&& set SCRAPER_RUN_ID=japan-pt1-w3&& call run-core.bat"
start "ScrapScrapWorker japan-pt1 [Nagoya]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=japan&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Nagoya&& set SCRAPER_LOCALE=ja&& set SCRAPER_RUN_ID=japan-pt1-w4&& call run-core.bat"
start "ScrapScrapWorker japan-pt1 [Sapporo]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=japan&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Sapporo&& set SCRAPER_LOCALE=ja&& set SCRAPER_RUN_ID=japan-pt1-w5&& call run-core.bat"
start "ScrapScrapWorker japan-pt1 [Kobe]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=japan&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Kobe&& set SCRAPER_LOCALE=ja&& set SCRAPER_RUN_ID=japan-pt1-w6&& call run-core.bat"
start "ScrapScrapWorker japan-pt1 [Kyoto]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=japan&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Kyoto&& set SCRAPER_LOCALE=ja&& set SCRAPER_RUN_ID=japan-pt1-w7&& call run-core.bat"
start "ScrapScrapWorker japan-pt1 [Fukuoka]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=japan&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Fukuoka&& set SCRAPER_LOCALE=ja&& set SCRAPER_RUN_ID=japan-pt1-w8&& call run-core.bat"
start "ScrapScrapWorker japan-pt1 [Kawasaki]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=japan&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Kawasaki&& set SCRAPER_LOCALE=ja&& set SCRAPER_RUN_ID=japan-pt1-w9&& call run-core.bat"
start "ScrapScrapWorker japan-pt1 [Saitama]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=japan&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Saitama&& set SCRAPER_LOCALE=ja&& set SCRAPER_RUN_ID=japan-pt1-w10&& call run-core.bat"

echo Launched 10 worker(s) for japan-pt1.
echo Press any key to close this launcher console (workers will keep running).
pause >nul