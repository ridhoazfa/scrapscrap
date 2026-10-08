@echo off
REM ScrapScrap - 1-Click Multi-City Worker Pool (thailand Part 1)
cd /d "%~dp0\.."
if exist "data\state\STOP_ALL_SCRAPERS" del /f /q "data\state\STOP_ALL_SCRAPERS" >nul 2>&1

start "ScrapScrapWorker thailand-pt1 [Bangkok]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=thailand&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Bangkok&& set SCRAPER_LOCALE=th&& set SCRAPER_RUN_ID=thailand-pt1-w1&& call run-core.bat"
start "ScrapScrapWorker thailand-pt1 [Nonthaburi]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=thailand&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Nonthaburi&& set SCRAPER_LOCALE=th&& set SCRAPER_RUN_ID=thailand-pt1-w2&& call run-core.bat"
start "ScrapScrapWorker thailand-pt1 [Pak Kret]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=thailand&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Pak Kret&& set SCRAPER_LOCALE=th&& set SCRAPER_RUN_ID=thailand-pt1-w3&& call run-core.bat"
start "ScrapScrapWorker thailand-pt1 [Chiang Mai]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=thailand&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Chiang Mai&& set SCRAPER_LOCALE=th&& set SCRAPER_RUN_ID=thailand-pt1-w4&& call run-core.bat"
start "ScrapScrapWorker thailand-pt1 [Pattaya]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=thailand&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Pattaya&& set SCRAPER_LOCALE=th&& set SCRAPER_RUN_ID=thailand-pt1-w5&& call run-core.bat"
start "ScrapScrapWorker thailand-pt1 [Phuket]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=thailand&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Phuket&& set SCRAPER_LOCALE=th&& set SCRAPER_RUN_ID=thailand-pt1-w6&& call run-core.bat"
start "ScrapScrapWorker thailand-pt1 [Hat Yai]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=thailand&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Hat Yai&& set SCRAPER_LOCALE=th&& set SCRAPER_RUN_ID=thailand-pt1-w7&& call run-core.bat"
start "ScrapScrapWorker thailand-pt1 [Udon Thani]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=thailand&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Udon Thani&& set SCRAPER_LOCALE=th&& set SCRAPER_RUN_ID=thailand-pt1-w8&& call run-core.bat"
start "ScrapScrapWorker thailand-pt1 [Nakhon Ratchasima]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=thailand&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Nakhon Ratchasima&& set SCRAPER_LOCALE=th&& set SCRAPER_RUN_ID=thailand-pt1-w9&& call run-core.bat"
start "ScrapScrapWorker thailand-pt1 [Surat Thani]" cmd /c "set SCRAPER_WORKER_FLAG=1&& set SCRAPER_NO_GLOBAL_KILL=1&& set SCRAPER_COUNTRY=thailand&& set SCRAPER_SPATIAL_MESH=1&& set SCRAPER_CITIES=Surat Thani&& set SCRAPER_LOCALE=th&& set SCRAPER_RUN_ID=thailand-pt1-w10&& call run-core.bat"

echo Launched 10 worker(s) for thailand-pt1.
echo Press any key to close this launcher console (workers will keep running).
pause >nul