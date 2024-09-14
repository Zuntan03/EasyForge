@echo off
chcp 65001 > NUL

if not exist %~dp0ComfyUI\venv\ (
	echo call %~dp0setup\ComfyUI-Update.bat
	call %~dp0setup\ComfyUI-Update.bat
)
if not exist %~dp0ComfyUI\venv\ ( pause & exit /b 1 )

call %~dp0setup\git\Git-SetPath.bat
if %ERRORLEVEL% neq 0 ( pause & exit /b 1 )

pushd %~dp0ComfyUI

call %~dp0setup\install\ComfyUI-UpdateConfig.bat user\default\comfy.settings.json
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

echo python main.py --auto-launch %*
python main.py --auto-launch %*

popd rem %~dp0ComfyUI
