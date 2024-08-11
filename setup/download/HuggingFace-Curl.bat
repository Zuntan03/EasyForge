@echo off
chcp 65001 > NUL
set CURL_CMD=C:\Windows\System32\curl.exe -kL

set DOWNLOAD_DIR=%~1
set DOWNLOAD_FILE=%~2
set REPO_ID=%~3
set REPO_DIR=%~4

set "DOWNLOAD_PATH=%DOWNLOAD_DIR%\%DOWNLOAD_FILE%"
set "HF_MODEL_CARD=https://huggingface.co/%REPO_ID%"
set "HF_DOWNLOAD_URL=%HF_MODEL_CARD%/resolve/main/%REPO_DIR%%DOWNLOAD_FILE%"

echo %HF_MODEL_CARD% %REPO_DIR%%DOWNLOAD_FILE%
if exist "%DOWNLOAD_PATH%" ( exit /b 0 )
if not exist "%DOWNLOAD_DIR%\" ( mkdir "%DOWNLOAD_DIR%" )

echo %CURL_CMD% -o "%DOWNLOAD_PATH%" "%HF_DOWNLOAD_URL%"
%CURL_CMD% -o "%DOWNLOAD_PATH%" "%HF_DOWNLOAD_URL%"
if %ERRORLEVEL% neq 0 ( pause & exit /b 1)
