@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (czech-republic Part 2)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker czech-republic-pt2 [Zlin]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=czech-republic&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Zlin&& set SCRAPER_LOCALE=cs&& set SCRAPER_RUN_ID=czech-republic-pt2-w1&& call run-core.bat"
start "ScrapScrapWorker czech-republic-pt2 [Havirov]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=czech-republic&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Havirov&& set SCRAPER_LOCALE=cs&& set SCRAPER_RUN_ID=czech-republic-pt2-w2&& call run-core.bat"
start "ScrapScrapWorker czech-republic-pt2 [Kladno]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=czech-republic&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Kladno&& set SCRAPER_LOCALE=cs&& set SCRAPER_RUN_ID=czech-republic-pt2-w3&& call run-core.bat"
start "ScrapScrapWorker czech-republic-pt2 [Most]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=czech-republic&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Most&& set SCRAPER_LOCALE=cs&& set SCRAPER_RUN_ID=czech-republic-pt2-w4&& call run-core.bat"
start "ScrapScrapWorker czech-republic-pt2 [Opava]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=czech-republic&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Opava&& set SCRAPER_LOCALE=cs&& set SCRAPER_RUN_ID=czech-republic-pt2-w5&& call run-core.bat"
start "ScrapScrapWorker czech-republic-pt2 [Frydek-Mistek]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=czech-republic&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Frydek-Mistek&& set SCRAPER_LOCALE=cs&& set SCRAPER_RUN_ID=czech-republic-pt2-w6&& call run-core.bat"
start "ScrapScrapWorker czech-republic-pt2 [Karvina]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=czech-republic&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Karvina&& set SCRAPER_LOCALE=cs&& set SCRAPER_RUN_ID=czech-republic-pt2-w7&& call run-core.bat"
start "ScrapScrapWorker czech-republic-pt2 [Jihlava]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=czech-republic&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Jihlava&& set SCRAPER_LOCALE=cs&& set SCRAPER_RUN_ID=czech-republic-pt2-w8&& call run-core.bat"
start "ScrapScrapWorker czech-republic-pt2 [Teplice]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=czech-republic&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Teplice&& set SCRAPER_LOCALE=cs&& set SCRAPER_RUN_ID=czech-republic-pt2-w9&& call run-core.bat"
start "ScrapScrapWorker czech-republic-pt2 [Decin]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=czech-republic&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Decin&& set SCRAPER_LOCALE=cs&& set SCRAPER_RUN_ID=czech-republic-pt2-w10&& call run-core.bat"

echo Launched 10 worker(s) for czech-republic-pt2.
echo Press any key to close this launcher console (workers will keep running).
pause >nul