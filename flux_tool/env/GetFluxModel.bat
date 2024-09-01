@echo off
chcp 65001 > NUL

set "FLUX_MODEL_MSG=Drag and drop the Flux model (*.safetensors) and press Enter."
if "%LANG_TAG%" == "ja" (
	set "FLUX_MODEL_MSG=Flux モデル (*.safetensors) をドラッグアンドドロップして Enter してください。"
)

set "FLUX_MODEL="
set /p "FLUX_MODEL=%FLUX_MODEL_MSG%"
for %%i in ("%FLUX_MODEL%") do (
	set "FLUX_MODEL_DIR=%%~dpi"
	set "FLUX_MODEL_NAME=%%~ni"
	set "FLUX_MODEL_EXT=%%~xi"
)
for %%i in ("%FLUX_MODEL_DIR%.") do set "FLUX_MODEL_DIR_NAME=%%~ni"
set FLUX_MODEL=%FLUX_MODEL_DIR%%FLUX_MODEL_NAME%%FLUX_MODEL_EXT%

if not exist "%FLUX_MODEL%" (
	echo [Error] Flux model file not found: %FLUX_MODEL%
	pause & exit /b 1
)

@REM echo FLUX_MODEL: %FLUX_MODEL_DIR%%FLUX_MODEL_NAME%%FLUX_MODEL_EXT%
