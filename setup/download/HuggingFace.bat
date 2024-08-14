@echo off
chcp 65001 > NUL

set DOWNLOAD_DIR=%~1
set DOWNLOAD_FILE=%~2
set REPO_ID=%~3
set REPO_DIR=%~4

set "HF_MODEL_CARD=https://huggingface.co/%REPO_ID%"
set "HF_DOWNLOAD_URL=%HF_MODEL_CARD%/resolve/main/%REPO_DIR%%DOWNLOAD_FILE%"

echo %HF_MODEL_CARD% %REPO_DIR%%DOWNLOAD_FILE%

call %~dp0Aria.bat "%DOWNLOAD_DIR%" "%DOWNLOAD_FILE%" "%HF_DOWNLOAD_URL%"
if %ERRORLEVEL% neq 0 ( exit /b 1)
