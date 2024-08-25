@echo off
chcp 65001 > NUL
cd /d %~dp0..\sd-scripts
call venv\Scripts\activate.bat

if "%PYTHONPATH%"=="" (
    set "PYTHONPATH=%CD%"
) else (
    set "PYTHONPATH=%PYTHONPATH%;%CD%"
)

cmd /k
