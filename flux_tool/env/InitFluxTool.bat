@echo off
chcp 65001 > NUL

set "SD_SCRIPTS=%~dp0..\..\sd-scripts"
if not exist "%SD_SCRIPTS%\venv" (
	setlocal enabledelayedexpansion
	call "%~dp0..\..\setup\SdScripts-Update.bat"
	if !ERRORLEVEL! neq 0 ( endlocal & exit /b 1 )
	endlocal
)

pushd "%SD_SCRIPTS%"
call "%~dp0..\..\setup\python\Python-Activate.bat"
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )
popd rem "%SD_SCRIPTS%"

if "%PYTHONPATH%"=="" (
    set "PYTHONPATH=%SD_SCRIPTS%"
) else (
    set "PYTHONPATH=%PYTHONPATH%;%SD_SCRIPTS%"
)

set PS_CMD=PowerShell -Version 5.1 -NoProfile -ExecutionPolicy Bypass
set "LANG_TAG="
@REM for /f "tokens=*" %%i in ('%PS_CMD% -c "Get-WinUserLanguageList | ForEach-Object { $_.LanguageTag }"') do set "LANG_TAG=%%i"
for /f "tokens=*" %%i in ('%PS_CMD% -c "(Get-WinUserLanguageList).LanguageTag"') do set "LANG_TAG=%%i"

set "MERGE_LORA=python "%SD_SCRIPTS%\networks\flux_merge_lora.py""
if not exist "%~dp0MergeLoraOption.txt" ( echo --save_precision bf16 >"%~dp0MergeLoraOption.txt")
set /p MERGE_LORA_OPTION=<"%~dp0MergeLoraOption.txt"

set "EXTRACT_LORA=python "%SD_SCRIPTS%\networks\flux_extract_lora.py""
if not exist "%~dp0ExtractLoraOption.txt" ( echo --device cuda --mem_eff_safe_open --save_precision bf16 >"%~dp0ExtractLoraOption.txt")
set /p EXTRACT_LORA_OPTION=<"%~dp0ExtractLoraOption.txt"
