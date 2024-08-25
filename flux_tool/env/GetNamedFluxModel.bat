@echo off
chcp 65001 > NUL

set "MODEL_NAME=%~1"

call "%~dp0GetFluxModel.bat"
if %ERRORLEVEL% neq 0 ( exit /b 1 )

set "%MODEL_NAME%_MODEL=%FLUX_MODEL%"
set "%MODEL_NAME%_MODEL_DIR=%FLUX_MODEL_DIR%"
set "%MODEL_NAME%_MODEL_NAME=%FLUX_MODEL_NAME%"
set "%MODEL_NAME%_MODEL_EXT=%FLUX_MODEL_EXT%"
