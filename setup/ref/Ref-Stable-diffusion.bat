@echo off
chcp 65001 > NUL

if "%~1"=="" (
	echo "[ERROR] Drag and Drop stable-diffusion-webui-forge\models\Stable-diffusion"
	pause & exit /b 1
)

set "REF_DST_DIR=%~dp0..\..\stable-diffusion-webui-forge\models\Stable-diffusion"
if not exist "%REF_DST_DIR%\" ( mkdir "%REF_DST_DIR%" )
call %~dp0..\install\LinkDir.bat "%REF_DST_DIR%\%~nx1" "%~1"
if %errorlevel% neq 0 ( exit /b 1 )
