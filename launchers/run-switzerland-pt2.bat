@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (switzerland Part 2)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker switzerland-pt2 [Thun]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=switzerland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Thun&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=switzerland-pt2-w1&& call run-core.bat"
start "ScrapScrapWorker switzerland-pt2 [Bellinzona]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=switzerland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Bellinzona&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=switzerland-pt2-w2&& call run-core.bat"
start "ScrapScrapWorker switzerland-pt2 [Koniz]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=switzerland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Koniz&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=switzerland-pt2-w3&& call run-core.bat"
start "ScrapScrapWorker switzerland-pt2 [La Chaux-de-Fonds]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=switzerland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=La Chaux-de-Fonds&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=switzerland-pt2-w4&& call run-core.bat"
start "ScrapScrapWorker switzerland-pt2 [Schaffhausen]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=switzerland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Schaffhausen&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=switzerland-pt2-w5&& call run-core.bat"
start "ScrapScrapWorker switzerland-pt2 [Fribourg]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=switzerland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Fribourg&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=switzerland-pt2-w6&& call run-core.bat"
start "ScrapScrapWorker switzerland-pt2 [Vernier]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=switzerland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Vernier&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=switzerland-pt2-w7&& call run-core.bat"
start "ScrapScrapWorker switzerland-pt2 [Chur]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=switzerland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Chur&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=switzerland-pt2-w8&& call run-core.bat"
start "ScrapScrapWorker switzerland-pt2 [Neuchatel]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=switzerland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Neuchatel&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=switzerland-pt2-w9&& call run-core.bat"
start "ScrapScrapWorker switzerland-pt2 [Uster]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=switzerland&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Uster&& set SCRAPER_LOCALE=de&& set SCRAPER_RUN_ID=switzerland-pt2-w10&& call run-core.bat"

echo Launched 10 worker(s) for switzerland-pt2.
echo Press any key to close this launcher console (workers will keep running).
pause >nul