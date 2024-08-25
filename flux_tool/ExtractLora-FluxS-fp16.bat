@echo off
call "%~dp0env\InitFluxTool.bat"

set "EXTRACT_LORA_MSG=Extract LoRA from Flux schnell fp16 derivative model (22GB~)."
if "%LANG_TAG%" == "ja" (
	set "EXTRACT_LORA_MSG=Flux schnell fp16 派生モデル (22GB~) から LoRA を抽出します。"

)
echo %EXTRACT_LORA_MSG%

echo.
echo %TUNED_MODEL_MSG%
call "%~dp0env\GetNamedFluxModel.bat" "TUNED"
if %ERRORLEVEL% neq 0 ( exit /b 1 )
echo TUNED_MODEL: %TUNED_MODEL%

echo.
call "%~dp0env\GetFluxLoraDim.bat"
if %ERRORLEVEL% neq 0 ( exit /b 1 )
echo FLUX_LORA_DIM: %FLUX_LORA_DIM%

echo call "%~dp0..\download\Stable-diffusion\FluxS-Base\flux1-schnell.bat"
call "%~dp0..\download\Stable-diffusion\FluxS-Base\flux1-schnell.bat"
if %ERRORLEVEL% neq 0 ( exit /b 1 )

echo set "ORG_MODEL=%~dp0..\stable-diffusion-webui-forge\models\Stable-diffusion\FluxS-Base\flux1-schnell.safetensors"
set "ORG_MODEL=%~dp0..\stable-diffusion-webui-forge\models\Stable-diffusion\FluxS-Base\flux1-schnell.safetensors"
if not exist "%ORG_MODEL%" ( echo Model not found: %ORG_MODEL% & pause & exit /b 1 )

call "%~dp0env\GetLoraSaveDir.bat" "%TUNED_MODEL_DIR%"
set "SAVE_TO=%SAVE_DIR%%TUNED_MODEL_NAME%-flux1-schnell-d%FLUX_LORA_DIM%.safetensors"
echo SAVE_TO: %SAVE_TO%

echo.
call "%~dp0env\ExtractLora.bat"
if %ERRORLEVEL% neq 0 ( exit /b 1 )
