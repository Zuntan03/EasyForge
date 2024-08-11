@echo off
chcp 65001 > NUL
pushd %~dp0
set PS_CMD=PowerShell -Version 5.1 -NoProfile -ExecutionPolicy Bypass

set CURL_CMD=C:\Windows\System32\curl.exe
if not exist %CURL_CMD% (
	echo "[ERROR] %CURL_CMD% が見つかりません。"
	pause & popd & exit /b 1
)

if not exist "C:\Windows\System32\where.exe" (
	echo "[ERROR] C:\Windows\System32\where.exe が見つかりません。"
	pause & popd & exit /b 1
)

%PS_CMD% -c "if ('$env:CD' -match '^[a-zA-Z0-9:_\\/-]+$') {exit 0}; exit 1"
if %ERRORLEVEL% neq 0 (
	echo "[ERROR] 現在のフォルダパスに英数字・ハイフン・アンダーバー以外が含まれています。%CD%"
	echo "英数字・ハイフン・アンダーバーのフォルダパスに bat ファイルを移動して、再実行してください。"
	pause & popd & exit /b 1
)

if exist stable-diffusion-webui-forge\venv\ (
	setlocal enabledelayedexpansion
	echo "更新後の動作に問題があれば、venv を削除しつつ再更新してください。"
	echo "stable-diffusion-webui-forge\venv\ を削除しますか？ [y/n]"
	set /p YES_OR_NO=
	if /i "!YES_OR_NO!" == "y" (
		echo rmdir /S /Q stable-diffusion-webui-forge\venv\
		rmdir /S /Q stable-diffusion-webui-forge\venv\
		if !ERRORLEVEL! neq 0 ( pause & endlocal & popd & exit /b 1 )
	)
	endlocal
)

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

call setup\Forge-Update.bat
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0

if exist %~dp0EasyForgeInstaller.bat ( del %~dp0EasyForgeInstaller.bat )
