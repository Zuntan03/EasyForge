@echo off
chcp 65001 > NUL
pushd %~dp0
set PS_CMD=PowerShell -Version 5.1 -NoProfile -ExecutionPolicy Bypass
set CURL_CMD=C:\Windows\System32\curl.exe

if exist setup\install\env\EasyForge-main\ (
	setlocal enabledelayedexpansion
	echo rmdir /S /Q setup\install\env\EasyForge-main\
	rmdir /S /Q setup\install\env\EasyForge-main\
	if !ERRORLEVEL! neq 0 ( pause & endlocal & popd & exit /b 1 )
	endlocal
)

if not exist setup\install\env\ ( mkdir setup\install\env )

echo %CURL_CMD% -kLo setup\install\env\EasyForge.zip https://github.com/Zuntan03/EasyForge/archive/refs/heads/main.zip
%CURL_CMD% -kLo setup\install\env\EasyForge.zip https://github.com/Zuntan03/EasyForge/archive/refs/heads/main.zip
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

echo %PS_CMD% Expand-Archive -Path setup\install\env\EasyForge.zip -DestinationPath setup\install\env -Force
%PS_CMD% Expand-Archive -Path setup\install\env\EasyForge.zip -DestinationPath setup\install\env -Force
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

echo del setup\install\env\EasyForge.zip
del setup\install\env\EasyForge.zip
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

echo /QSY setup\install\env\EasyForge-main\ .
xcopy /QSY setup\install\env\EasyForge-main\ .
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )


echo call setup\ComfyUI-Update.bat
call setup\ComfyUI-Update.bat
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0
