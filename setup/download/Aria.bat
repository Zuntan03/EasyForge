@echo off
chcp 65001 > NUL
set CURL_CMD=C:\Windows\System32\curl.exe -kL
set PS_CMD=PowerShell -Version 5.1 -NoProfile -ExecutionPolicy Bypass

set DOWNLOAD_DIR=%~1
set DOWNLOAD_FILE=%~2
set DOWNLOAD_URL=%~3

if exist "%DOWNLOAD_DIR%\%DOWNLOAD_FILE%" (
	if exist "%~dp0ARIA_USE_CURL" ( exit /b 0 )
	if not exist "%DOWNLOAD_DIR%\%DOWNLOAD_FILE%.aria2" ( exit /b 0 )
)

if not exist %DOWNLOAD_DIR%\ ( mkdir %DOWNLOAD_DIR% )

if exist "%~dp0ARIA_USE_CURL" (
	setlocal enabledelayedexpansion
	echo %CURL_CMD% -o "%DOWNLOAD_DIR%\%DOWNLOAD_FILE%" %DOWNLOAD_URL%
	%CURL_CMD% -o "%DOWNLOAD_DIR%\%DOWNLOAD_FILE%" %DOWNLOAD_URL%
	if !ERRORLEVEL! neq 0 ( pause & endlocal & exit /b 1 )
	endlocal & exit /b 0
)

if not exist "%~dp0Aria-MaxConnection.txt" ( echo 4 >"%~dp0Aria-MaxConnection.txt")
set /p ARIA_MAX_CONNECTION=<"%~dp0Aria-MaxConnection.txt"

set ARIA_VER=1.37.0
set ARIA_NAME=aria2-%ARIA_VER%-win-64bit-build1
set ARIA_EXE=%~dp0env\%ARIA_NAME%\aria2c.exe
set ARIA_CMD=%ARIA_EXE% --console-log-level=warn --file-allocation=none --check-certificate=false -x%ARIA_MAX_CONNECTION%

if not exist %ARIA_EXE% (
	if not exist %~dp0env\ ( mkdir %~dp0env )

	setlocal enabledelayedexpansion
	echo %CURL_CMD% -o %~dp0env\aria2.zip https://github.com/aria2/aria2/releases/download/release-%ARIA_VER%/%ARIA_NAME%.zip
	%CURL_CMD% -o %~dp0env\aria2.zip https://github.com/aria2/aria2/releases/download/release-%ARIA_VER%/%ARIA_NAME%.zip
	if !ERRORLEVEL! neq 0 ( pause & endlocal & exit /b 1 )

	echo 	%PS_CMD% "try { Expand-Archive -Path %~dp0env\aria2.zip  -DestinationPath %~dp0env\ -Force } catch { exit 1 }"
	%PS_CMD% "try { Expand-Archive -Path %~dp0env\aria2.zip  -DestinationPath %~dp0env\ -Force } catch { exit 1 }"
	if !ERRORLEVEL! neq 0 ( pause & endlocal & exit /b 1)

	echo del /Q %~dp0env\aria2.zip
	del /Q %~dp0env\aria2.zip
	if !ERRORLEVEL! neq 0 ( pause & endlocal & exit /b 1 )
	endlocal
)

echo %ARIA_CMD% -o "%DOWNLOAD_DIR%\%DOWNLOAD_FILE%" %DOWNLOAD_URL%
%ARIA_CMD% -o "%DOWNLOAD_DIR%\%DOWNLOAD_FILE%" %DOWNLOAD_URL%
if %ERRORLEVEL% neq 0 ( pause & exit /b 1 )
