@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (lithuania Part 1)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker lithuania-pt1 [Vilnius]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=lithuania&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Vilnius&& set SCRAPER_LOCALE=lt&& set SCRAPER_RUN_ID=lithuania-pt1-w1&& call run-core.bat"
start "ScrapScrapWorker lithuania-pt1 [Kaunas]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=lithuania&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Kaunas&& set SCRAPER_LOCALE=lt&& set SCRAPER_RUN_ID=lithuania-pt1-w2&& call run-core.bat"
start "ScrapScrapWorker lithuania-pt1 [Klaipeda]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=lithuania&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Klaipeda&& set SCRAPER_LOCALE=lt&& set SCRAPER_RUN_ID=lithuania-pt1-w3&& call run-core.bat"
start "ScrapScrapWorker lithuania-pt1 [Siauliai]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=lithuania&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Siauliai&& set SCRAPER_LOCALE=lt&& set SCRAPER_RUN_ID=lithuania-pt1-w4&& call run-core.bat"
start "ScrapScrapWorker lithuania-pt1 [Panevezys]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=lithuania&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Panevezys&& set SCRAPER_LOCALE=lt&& set SCRAPER_RUN_ID=lithuania-pt1-w5&& call run-core.bat"
start "ScrapScrapWorker lithuania-pt1 [Alytus]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=lithuania&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Alytus&& set SCRAPER_LOCALE=lt&& set SCRAPER_RUN_ID=lithuania-pt1-w6&& call run-core.bat"
start "ScrapScrapWorker lithuania-pt1 [Marijampole]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=lithuania&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Marijampole&& set SCRAPER_LOCALE=lt&& set SCRAPER_RUN_ID=lithuania-pt1-w7&& call run-core.bat"
start "ScrapScrapWorker lithuania-pt1 [Mazeikiai]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=lithuania&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Mazeikiai&& set SCRAPER_LOCALE=lt&& set SCRAPER_RUN_ID=lithuania-pt1-w8&& call run-core.bat"
start "ScrapScrapWorker lithuania-pt1 [Jonava]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=lithuania&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Jonava&& set SCRAPER_LOCALE=lt&& set SCRAPER_RUN_ID=lithuania-pt1-w9&& call run-core.bat"
start "ScrapScrapWorker lithuania-pt1 [Utena]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=lithuania&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Utena&& set SCRAPER_LOCALE=lt&& set SCRAPER_RUN_ID=lithuania-pt1-w10&& call run-core.bat"

echo Launched 10 worker(s) for lithuania-pt1.
echo Press any key to close this launcher console (workers will keep running).
pause >nul