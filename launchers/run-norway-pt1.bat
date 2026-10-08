@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (norway Part 1)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker norway-pt1 [Oslo]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=norway&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Oslo&& set SCRAPER_LOCALE=no&& set SCRAPER_RUN_ID=norway-pt1-w1&& call run-core.bat"
start "ScrapScrapWorker norway-pt1 [Bergen]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=norway&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Bergen&& set SCRAPER_LOCALE=no&& set SCRAPER_RUN_ID=norway-pt1-w2&& call run-core.bat"
start "ScrapScrapWorker norway-pt1 [Trondheim]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=norway&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Trondheim&& set SCRAPER_LOCALE=no&& set SCRAPER_RUN_ID=norway-pt1-w3&& call run-core.bat"
start "ScrapScrapWorker norway-pt1 [Stavanger]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=norway&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Stavanger&& set SCRAPER_LOCALE=no&& set SCRAPER_RUN_ID=norway-pt1-w4&& call run-core.bat"
start "ScrapScrapWorker norway-pt1 [Sandvika]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=norway&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Sandvika&& set SCRAPER_LOCALE=no&& set SCRAPER_RUN_ID=norway-pt1-w5&& call run-core.bat"
start "ScrapScrapWorker norway-pt1 [Drammen]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=norway&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Drammen&& set SCRAPER_LOCALE=no&& set SCRAPER_RUN_ID=norway-pt1-w6&& call run-core.bat"
start "ScrapScrapWorker norway-pt1 [Fredrikstad]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=norway&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Fredrikstad&& set SCRAPER_LOCALE=no&& set SCRAPER_RUN_ID=norway-pt1-w7&& call run-core.bat"
start "ScrapScrapWorker norway-pt1 [Porsgrunn]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=norway&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Porsgrunn&& set SCRAPER_LOCALE=no&& set SCRAPER_RUN_ID=norway-pt1-w8&& call run-core.bat"
start "ScrapScrapWorker norway-pt1 [Kristiansand]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=norway&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Kristiansand&& set SCRAPER_LOCALE=no&& set SCRAPER_RUN_ID=norway-pt1-w9&& call run-core.bat"
start "ScrapScrapWorker norway-pt1 [Alesund]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=norway&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Alesund&& set SCRAPER_LOCALE=no&& set SCRAPER_RUN_ID=norway-pt1-w10&& call run-core.bat"

echo Launched 10 worker(s) for norway-pt1.
echo Press any key to close this launcher console (workers will keep running).
pause >nul