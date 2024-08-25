@echo off
chcp 65001 > NUL

set "FLUX_LORA_DIM_MSG=Enter the Flux LoRA Dim in numerical values (Default: 16)."
if "%LANG_TAG%" == "ja" (
	set "FLUX_LORA_DIM_MSG=Flux LoRA の次元数 (Dim) を数値で入力してください（デフォルト: 16 ）。"
)

set "FLUX_LORA_DIM="
set /p FLUX_LORA_DIM=%FLUX_LORA_DIM_MSG%
if "%FLUX_LORA_DIM%" == "" (
	set "FLUX_LORA_DIM=16"
	@REM 未入力時は ERRORLEVEL が 1
	exit /b 0
)
