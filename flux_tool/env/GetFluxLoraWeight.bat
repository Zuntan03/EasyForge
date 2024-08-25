@echo off
chcp 65001 > NUL

set "FLUX_LORA_WEIGHT_MSG=Enter the Flux LoRA weights in numerical values (Default: 1.0)."
if "%LANG_TAG%" == "ja" (
	set "FLUX_LORA_WEIGHT_MSG=Flux LoRA の重みを数値で入力してください（デフォルト: 1.0 ）。"
)

set "FLUX_LORA_WEIGHT="
set /p FLUX_LORA_WEIGHT=%FLUX_LORA_WEIGHT_MSG%
if "%FLUX_LORA_WEIGHT%" == "" (
	set "FLUX_LORA_WEIGHT=1.0"
	@REM 未入力時は ERRORLEVEL が 1
	exit /b 0
)
