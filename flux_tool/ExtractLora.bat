@echo off
call "%~dp0env\InitFluxTool.bat"

set "EXTRACT_LORA_MSG=LoRA is extracted from the difference between the two Flux models."
set "TUNED_MODEL_MSG=Specifies the adjusted model of the side to be pulled."
set "ORG_MODEL_MSG=Specifies the original model of the pulling side."
if "%LANG_TAG%" == "ja" (
	set "EXTRACT_LORA_MSG=引かれる側と引く側のふたつの Flux モデルの差分から LoRA を抽出します。"
	set "TUNED_MODEL_MSG=引かれる側の調整済みモデルを指定します。"
	set "ORG_MODEL_MSG=引く側のオリジナルモデルを指定します。"
)
echo %EXTRACT_LORA_MSG%

echo.
echo %TUNED_MODEL_MSG%
call "%~dp0env\GetNamedFluxModel.bat" "TUNED"
if %ERRORLEVEL% neq 0 ( exit /b 1 )
echo TUNED_MODEL: %TUNED_MODEL%

echo.
echo %ORG_MODEL_MSG%
call "%~dp0env\GetNamedFluxModel.bat" "ORG"
if %ERRORLEVEL% neq 0 ( exit /b 1 )
echo ORG_MODEL: %ORG_MODEL%

echo.
call "%~dp0env\GetFluxLoraDim.bat"
if %ERRORLEVEL% neq 0 ( exit /b 1 )
echo FLUX_LORA_DIM: %FLUX_LORA_DIM%

call "%~dp0env\GetLoraSaveDir.bat" "%TUNED_MODEL_DIR%"
set "SAVE_TO=%SAVE_DIR%%TUNED_MODEL_NAME%-%ORG_MODEL_NAME%-d%FLUX_LORA_DIM%.safetensors"
echo SAVE_TO: %SAVE_TO%

echo.
call "%~dp0env\ExtractLora.bat"
if %ERRORLEVEL% neq 0 ( exit /b 1 )
