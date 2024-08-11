@echo off
chcp 65001 > NUL

if not exist "%~1" (
	echo "[ERROR] Drag and Drop stable-diffusion-webui-forge\models\adetailer"
	pause & exit /b 1
)

call %~dp0..\install\LinkDir.bat "%~dp0..\..\stable-diffusion-webui-forge\models\adetailer" "%~1"
if %ERRORLEVEL% neq 0 ( exit /b 1 )
