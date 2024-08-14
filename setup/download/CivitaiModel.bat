@echo off
chcp 65001 > NUL
set PS_CMD=PowerShell -Version 5.1 -NoProfile -ExecutionPolicy Bypass

set DOWNLOAD_DIR=%~1
set DOWNLOAD_FILE=%~2
set MODEL_ID=%~3
set VERSION_ID=%~4

set "MODEL_URL=https://civitai.com/models/%MODEL_ID%?modelVersionId=%VERSION_ID%"
set "DOWNLOAD_URL=https://civitai.com/api/download/models/%VERSION_ID%?token=%CIVITAI_API_KEY%"

echo %MODEL_URL% %DOWNLOAD_FILE%

set CONFIG_PATH=%~dp0..\..\stable-diffusion-webui-forge\config.json
set CIVITAI_API_KEY=
for /f "tokens=*" %%i in ('%PS_CMD% -c "$json = Get-Content -Raw -Path '%CONFIG_PATH%' | ConvertFrom-Json; $json.ch_civiai_api_key"') do set "CIVITAI_API_KEY=%%i"
if "%CIVITAI_API_KEY%"=="" (
	echo "[ERROR] Forge の Settings で Civitai の API Key を設定してください。"
	echo https://github.com/zixaphir/Stable-Diffusion-Webui-Civitai-Helper/wiki/Civitai-API-Key
	echo .
	echo "[ERROR] Please set Civitai's API Key in Forge's Settings."
	echo https://github.com/zixaphir/Stable-Diffusion-Webui-Civitai-Helper/wiki/Civitai-API-Key
	pause & exit /b 1
)

call "%~dp0Aria.bat" "%DOWNLOAD_DIR%" "%DOWNLOAD_FILE%" "%DOWNLOAD_URL%"
if %ERRORLEVEL% neq 0 ( exit /b 1)
