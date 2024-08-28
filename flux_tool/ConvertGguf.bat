@echo off
chcp 65001 > NUL

set PS_CMD=PowerShell -Version 5.1 -NoProfile -ExecutionPolicy Bypass
set "LANG_TAG="
for /f "tokens=*" %%i in ('%PS_CMD% -c "(Get-WinUserLanguageList).LanguageTag"') do set "LANG_TAG=%%i"

set "CONVERT_GGUF_MSG=Convert Flux model (fp16, 22GB~ recommended) to GGUF."
if "%LANG_TAG%" == "ja" (
	set "CONVERT_GGUF_MSG=Flux モデル（fp16, 22GB~ 推奨）を GGUF に変換します。"
)
echo %CONVERT_GGUF_MSG%

set "SAFETENSOR_MODEL=%~1"
if "%SAFETENSOR_MODEL%" == "" ( call "%~dp0env\GetFluxModel.bat" )
if "%SAFETENSOR_MODEL%" == "" ( set "SAFETENSOR_MODEL=%FLUX_MODEL%" )
if not exist "%SAFETENSOR_MODEL%" (
	echo [Error] Model not found: %SAFETENSOR_MODEL%
	pause & exit /b 1
)
echo SAFETENSOR_MODEL: %SAFETENSOR_MODEL%

if not exist "%~dp0env\ConvertGgufFormat.txt" ( echo Q8_0 Q6_K >"%~dp0env\ConvertGgufFormat.txt")
set /p CONVERT_GGUF_FORMAT=<"%~dp0env\ConvertGgufFormat.txt"

call "%~dp0env\ConvertGguf.bat" "%SAFETENSOR_MODEL%" %CONVERT_GGUF_FORMAT%
if %ERRORLEVEL% neq 0 ( exit /b 1 )
