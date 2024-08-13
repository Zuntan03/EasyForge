@echo off
chcp 65001 > NUL

set SD_WEB_UI=%~1
if not exist "%SD_WEB_UI%\embeddings" (
	echo "[ERROR] Drag and Drop stable-diffusion-webui installed folder. %SD_WEB_UI%"
	pause & exit /b 1
)

call %~dp0ref\Ref-embeddings.bat "%SD_WEB_UI%\embeddings"
if %ERRORLEVEL% neq 0 ( exit /b 1 )

if exist "%SD_WEB_UI%\models\adetailer" (
	setlocal enabledelayedexpansion
	call %~dp0ref\Ref-adetailer.bat "%SD_WEB_UI%\models\adetailer"
	if !ERRORLEVEL! neq 0 ( endlocal & exit /b 1 )
	endlocal
)

call %~dp0ref\Ref-ControlNet.bat "%SD_WEB_UI%\models\ControlNet"
if %ERRORLEVEL% neq 0 ( exit /b 1 )

call %~dp0ref\Ref-ESRGAN.bat "%SD_WEB_UI%\models\ESRGAN"
if %ERRORLEVEL% neq 0 ( exit /b 1 )

call %~dp0ref\Ref-Lora.bat "%SD_WEB_UI%\models\Lora"
if %ERRORLEVEL% neq 0 ( exit /b 1 )

call %~dp0ref\Ref-Stable-diffusion.bat "%SD_WEB_UI%\models\Stable-diffusion"
if %ERRORLEVEL% neq 0 ( exit /b 1 )

call %~dp0ref\Ref-VAE.bat "%SD_WEB_UI%\models\VAE"
if %ERRORLEVEL% neq 0 ( exit /b 1 )

if exist "%SD_WEB_UI%\extensions\sd-dynamic-prompts\wildcards" (
	setlocal enabledelayedexpansion
	call %~dp0ref\Ref-wildcards.bat "%SD_WEB_UI%\extensions\sd-dynamic-prompts\wildcards"
	if !ERRORLEVEL! neq 0 ( endlocal & exit /b 1 )
	endlocal
)
