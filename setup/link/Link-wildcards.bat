@echo off
chcp 65001 > NUL

if not exist "%~1" (
	echo "[ERROR] Drag and Drop stable-diffusion-webui-forge\extensions\sd-dynamic-prompts\wildcards"
	pause & exit /b 1
)

call %~dp0..\install\LinkDir.bat "%~dp0..\..\stable-diffusion-webui-forge\extensions\sd-dynamic-prompts\wildcards" "%~1"
if %ERRORLEVEL% neq 0 ( exit /b 1 )

if exist "%~dp0..\..\wildcards" ( rmdir "%~dp0..\..\wildcards" )
if %ERRORLEVEL% neq 0 ( pause & exit /b 1 )

call %~dp0..\install\LinkDir.bat "%~dp0..\..\wildcards" "%~1"
if %ERRORLEVEL% neq 0 ( exit /b 1 )
