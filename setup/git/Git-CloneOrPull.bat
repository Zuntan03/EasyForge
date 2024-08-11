@echo off
chcp 65001 > NUL

call %~dp0Git-SetPath.bat
if %ERRORLEVEL% neq 0 ( exit /b %ERRORLEVEL% )

set GIT_CLONE_OR_PULL_URL=%~1
echo %GIT_CLONE_OR_PULL_URL%

for /f "tokens=*" %%i in ("%GIT_CLONE_OR_PULL_URL%") do set GIT_CLONE_OR_PULL_DIR=%%~nxi

for /f "delims=" %%i in ('git -C %GIT_CLONE_OR_PULL_DIR% config --get remote.origin.url') do set "REMOTE_ORIGIN_URL=%%i"

set BRANCH_NAME=%2
if exist %GIT_CLONE_OR_PULL_DIR%\ (
	setlocal enabledelayedexpansion
	if "%GIT_CLONE_OR_PULL_URL%"=="%REMOTE_ORIGIN_URL%" (
		if "%BRANCH_NAME%" neq "" (
			echo git -C %GIT_CLONE_OR_PULL_DIR% switch -f %BRANCH_NAME% --quiet
			git -C %GIT_CLONE_OR_PULL_DIR% switch -f %BRANCH_NAME% --quiet
		)

		echo git -C %GIT_CLONE_OR_PULL_DIR% pull
		git -C %GIT_CLONE_OR_PULL_DIR% pull
		if !ERRORLEVEL! neq 0 ( pause & endlocal & exit /b 1 )
		endlocal & exit /b 0
	) else (
		echo rmdir /S /Q %GIT_CLONE_OR_PULL_DIR%
		rmdir /S /Q %GIT_CLONE_OR_PULL_DIR%
		if !ERRORLEVEL! neq 0 ( pause & endlocal & exit /b 1 )
	)
	endlocal
)

echo git clone %GIT_CLONE_OR_PULL_URL%
git clone %GIT_CLONE_OR_PULL_URL%
if %ERRORLEVEL% neq 0 ( pause & exit /b %ERRORLEVEL% )
