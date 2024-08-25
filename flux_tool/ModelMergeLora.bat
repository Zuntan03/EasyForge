@echo off
call "%~dp0env\InitFluxTool.bat"

set "MERGE_LORA_MSG=Merge Lora into the Flux model. 64GB of main memory is required."
if "%LANG_TAG%" == "ja" (
	set "MERGE_LORA_MSG=Flux モデルに Lora をマージします。メインメモリが 64GB 必要です。"
)
echo %MERGE_LORA_MSG%

echo.
call "%~dp0env\GetFluxModel.bat"
if %ERRORLEVEL% neq 0 ( exit /b 1 )
echo FLUX_MODEL: %FLUX_MODEL_DIR%%FLUX_MODEL_NAME%%FLUX_MODEL_EXT%

echo.
call "%~dp0env\GetFluxLora.bat"
if %ERRORLEVEL% neq 0 ( exit /b 1 )
echo FLUX_LORA: %FLUX_LORA_DIR%%FLUX_LORA_NAME%%FLUX_LORA_EXT%

echo.
call "%~dp0env\GetFluxLoraWeight.bat"
if %ERRORLEVEL% neq 0 ( exit /b 1 )
echo FLUX_LORA_WEIGHT: %FLUX_LORA_WEIGHT%

set "SAVE_TO=%FLUX_MODEL_DIR%%FLUX_MODEL_NAME%+%FLUX_LORA_NAME%x%FLUX_LORA_WEIGHT%%FLUX_MODEL_EXT%"
echo SAVE_TO: %SAVE_TO%

echo.
call "%~dp0env\MergeLora.bat" %*
if %ERRORLEVEL% neq 0 ( exit /b 1 )
