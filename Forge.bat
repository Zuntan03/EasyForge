@echo off
chcp 65001 > NUL

if not exist %~dp0stable-diffusion-webui-forge\venv\ (
	echo call %~dp0setup\Forge-Update.bat
	call %~dp0setup\Forge-Update.bat
)
if not exist %~dp0stable-diffusion-webui-forge\venv\ ( pause & exit /b 1 )

pushd %~dp0stable-diffusion-webui-forge

call %~dp0setup\install\Forge-UpdateConfig.bat config.json
if %ERRORLEVEL% neq 0 ( exit /b 1 )

if not exist ui-config.json (
	copy %~dp0setup\install\ui-config.json ui-config.json
)

if not exist styles.csv (
	copy %~dp0setup\install\styles.csv styles.csv
)

set PYTHON=%~dp0stable-diffusion-webui-forge\venv\Scripts\python.exe
set VENV_DIR=%~dp0stable-diffusion-webui-forge\venv
set GIT=
where /Q git
if %ERRORLEVEL% neq 0 ( set GIT=%~dp0setup\git\env\PortableGit\bin\git.exe )

set COMMANDLINE_ARGS=--api --enable-insecure-extension-access %*

echo PYTHON: %PYTHON%
echo VENV_DIR: %VENV_DIR%
echo GIT: %GIT%
echo webui.bat %COMMANDLINE_ARGS%
echo http://localhost:7860/
call webui.bat

popd rem %~dp0stable-diffusion-webui-forge
