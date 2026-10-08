@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (japan Part 2)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker japan-pt2 [Hiroshima]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=japan&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Hiroshima&& set SCRAPER_LOCALE=ja&& set SCRAPER_RUN_ID=japan-pt2-w1&& call run-core.bat"
start "ScrapScrapWorker japan-pt2 [Sendai]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=japan&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Sendai&& set SCRAPER_LOCALE=ja&& set SCRAPER_RUN_ID=japan-pt2-w2&& call run-core.bat"
start "ScrapScrapWorker japan-pt2 [Chiba]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=japan&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Chiba&& set SCRAPER_LOCALE=ja&& set SCRAPER_RUN_ID=japan-pt2-w3&& call run-core.bat"
start "ScrapScrapWorker japan-pt2 [Kitakyushu]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=japan&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Kitakyushu&& set SCRAPER_LOCALE=ja&& set SCRAPER_RUN_ID=japan-pt2-w4&& call run-core.bat"
start "ScrapScrapWorker japan-pt2 [Sakai]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=japan&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Sakai&& set SCRAPER_LOCALE=ja&& set SCRAPER_RUN_ID=japan-pt2-w5&& call run-core.bat"
start "ScrapScrapWorker japan-pt2 [Niigata]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=japan&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Niigata&& set SCRAPER_LOCALE=ja&& set SCRAPER_RUN_ID=japan-pt2-w6&& call run-core.bat"
start "ScrapScrapWorker japan-pt2 [Hamamatsu]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=japan&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Hamamatsu&& set SCRAPER_LOCALE=ja&& set SCRAPER_RUN_ID=japan-pt2-w7&& call run-core.bat"
start "ScrapScrapWorker japan-pt2 [Shizuoka]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=japan&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Shizuoka&& set SCRAPER_LOCALE=ja&& set SCRAPER_RUN_ID=japan-pt2-w8&& call run-core.bat"
start "ScrapScrapWorker japan-pt2 [Sagamihara]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=japan&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Sagamihara&& set SCRAPER_LOCALE=ja&& set SCRAPER_RUN_ID=japan-pt2-w9&& call run-core.bat"
start "ScrapScrapWorker japan-pt2 [Okayama]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=japan&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Okayama&& set SCRAPER_LOCALE=ja&& set SCRAPER_RUN_ID=japan-pt2-w10&& call run-core.bat"

echo Launched 10 worker(s) for japan-pt2.
echo Press any key to close this launcher console (workers will keep running).
pause >nul