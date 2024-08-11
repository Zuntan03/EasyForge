@echo off
chcp 65001 > NUL
set CURL_CMD=C:\Windows\System32\curl.exe -kL
set PS_CMD=PowerShell -Version 5.1 -NoProfile -ExecutionPolicy Bypass

where /Q git
if %ERRORLEVEL% equ 0 ( exit /b 0 )
cd > NUL
set PORTABLE_GIT_DIR=%~dp0env\PortableGit\bin
set PORTABLE_GIT_VERSION=2.46.0

if not exist %PORTABLE_GIT_DIR%\ (
	setlocal enabledelayedexpansion
	if not exist %~dp0env\ ( mkdir %~dp0env )
	echo https://github.com/git-for-windows/git/

	echo %CURL_CMD% -o %~dp0env\PortableGit.7z.exe https://github.com/git-for-windows/git/releases/download/v%PORTABLE_GIT_VERSION%.windows.1/PortableGit-%PORTABLE_GIT_VERSION%-64-bit.7z.exe
	%CURL_CMD% -o %~dp0env\PortableGit.7z.exe https://github.com/git-for-windows/git/releases/download/v%PORTABLE_GIT_VERSION%.windows.1/PortableGit-%PORTABLE_GIT_VERSION%-64-bit.7z.exe
	if !ERRORLEVEL! neq 0 ( pause & endlocal & exit /b 1 )

	start "" %PS_CMD% -Command "Start-Sleep -Seconds 2; $title='Portable Git for Windows 64-bit'; $window=Get-Process | Where-Object { $_.MainWindowTitle -eq $title } | Select-Object -First 1; if ($window -ne $null) { [void][System.Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic'); [Microsoft.VisualBasic.Interaction]::AppActivate($window.Id); Start-Sleep -Seconds 1; Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.SendKeys]::SendWait('{ENTER}') }"

	echo "設定を変更せずに、そのまま Portable Git for Windows をインストールしてください。"
	%~dp0env\PortableGit.7z.exe
	if !ERRORLEVEL! neq 0 ( pause & endlocal & exit /b 1 )

	echo del %~dp0env\PortableGit.7z.exe
	del %~dp0env\PortableGit.7z.exe
	if !ERRORLEVEL! neq 0 ( pause & endlocal & exit /b 1 )
	endlocal
)

set PATH=%PORTABLE_GIT_DIR%;%PATH%

where /Q git
if %ERRORLEVEL% equ 0 ( exit /b 0 )

echo "[Error] Git をインストールできませんでした。手動で Git for Windows をインストールしてください。"
pause & exit /b 1
