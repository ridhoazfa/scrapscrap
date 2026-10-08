@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (malaysia Part 1)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker malaysia-pt1 [Kuala Lumpur]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=malaysia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Kuala Lumpur&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=malaysia-pt1-w1&& call run-core.bat"
start "ScrapScrapWorker malaysia-pt1 [Penang]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=malaysia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Penang&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=malaysia-pt1-w2&& call run-core.bat"
start "ScrapScrapWorker malaysia-pt1 [Johor Bahru]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=malaysia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Johor Bahru&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=malaysia-pt1-w3&& call run-core.bat"
start "ScrapScrapWorker malaysia-pt1 [Ipoh]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=malaysia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Ipoh&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=malaysia-pt1-w4&& call run-core.bat"
start "ScrapScrapWorker malaysia-pt1 [Malacca]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=malaysia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Malacca&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=malaysia-pt1-w5&& call run-core.bat"
start "ScrapScrapWorker malaysia-pt1 [Kota Kinabalu]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=malaysia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Kota Kinabalu&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=malaysia-pt1-w6&& call run-core.bat"
start "ScrapScrapWorker malaysia-pt1 [Kuching]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=malaysia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Kuching&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=malaysia-pt1-w7&& call run-core.bat"
start "ScrapScrapWorker malaysia-pt1 [Shah Alam]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=malaysia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Shah Alam&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=malaysia-pt1-w8&& call run-core.bat"
start "ScrapScrapWorker malaysia-pt1 [Petaling Jaya]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=malaysia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Petaling Jaya&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=malaysia-pt1-w9&& call run-core.bat"
start "ScrapScrapWorker malaysia-pt1 [Subang Jaya]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=malaysia&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Subang Jaya&& set SCRAPER_LOCALE=en&& set SCRAPER_RUN_ID=malaysia-pt1-w10&& call run-core.bat"

echo Launched 10 worker(s) for malaysia-pt1.
echo Press any key to close this launcher console (workers will keep running).
pause >nul