@echo off
chcp 65001 > NUL

set SD_WEB_UI=%~1
if not exist "%SD_WEB_UI%\embeddings" (
	echo "[ERROR] Drag & Drop stable-diffusion-webui folder. %SD_WEB_UI%"
	pause & exit /b 1
)

call %~dp0link\Link-embeddings.bat "%SD_WEB_UI%\embeddings"
if %ERRORLEVEL% neq 0 ( exit /b 1 )

if exist "%SD_WEB_UI%\models\adetailer" (
	setlocal enabledelayedexpansion
	call %~dp0link\Link-adetailer.bat "%SD_WEB_UI%\models\adetailer"
	if !ERRORLEVEL! neq 0 ( endlocal & exit /b 1 )
	endlocal
)

call %~dp0link\Link-ControlNet.bat "%SD_WEB_UI%\models\ControlNet"
if %ERRORLEVEL% neq 0 ( exit /b 1 )

call %~dp0link\Link-ESRGAN.bat "%SD_WEB_UI%\models\ESRGAN"
if %ERRORLEVEL% neq 0 ( exit /b 1 )

call %~dp0link\Link-Lora.bat "%SD_WEB_UI%\models\Lora"
if %ERRORLEVEL% neq 0 ( exit /b 1 )

call %~dp0link\Link-Stable-diffusion.bat "%SD_WEB_UI%\models\Stable-diffusion"
if %ERRORLEVEL% neq 0 ( exit /b 1 )

call %~dp0link\Link-VAE.bat "%SD_WEB_UI%\models\VAE"
if %ERRORLEVEL% neq 0 ( exit /b 1 )

if exist "%SD_WEB_UI%\extensions\sd-dynamic-prompts\wildcards" (
	setlocal enabledelayedexpansion
	call %~dp0link\Link-wildcards.bat "%SD_WEB_UI%\extensions\sd-dynamic-prompts\wildcards"
	if !ERRORLEVEL! neq 0 ( endlocal & exit /b 1 )
	endlocal
)
