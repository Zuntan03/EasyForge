@echo off
chcp 65001 > NUL
cd /d %~dp0..\sd-scripts
set "PYTHONPATH=%PYTHONPATH%;%CD%"
call venv\Scripts\activate.bat
accelerate config
pause
