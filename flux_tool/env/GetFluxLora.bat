@echo off
chcp 65001 > NUL

set "FLUX_LORA_MSG=Drag and drop the Flux LoRA (*.safetensors) and press Enter."
if "%LANG_TAG%" == "ja" (
	set "FLUX_LORA_MSG=Flux LoRA (*.safetensors) をドラッグアンドドロップして Enter してください。"
)

set "FLUX_LORA="
set /p "FLUX_LORA=%FLUX_LORA_MSG%"
for %%i in ("%FLUX_LORA%") do (
	set "FLUX_LORA_DIR=%%~dpi"
	set "FLUX_LORA_NAME=%%~ni"
	set "FLUX_LORA_EXT=%%~xi"
)
for %%i in ("%FLUX_LORA_DIR%.") do set "FLUX_LORA_DIR_NAME=%%~ni"
set FLUX_LORA=%FLUX_LORA_DIR%%FLUX_LORA_NAME%%FLUX_LORA_EXT%

if not exist "%FLUX_LORA%" (
	echo [Error] Flux LoRA file not found: %FLUX_LORA%
	pause & exit /b 1
)

@REM echo FLUX_LORA: %FLUX_LORA_DIR%%FLUX_LORA_NAME%%FLUX_LORA_EXT%
