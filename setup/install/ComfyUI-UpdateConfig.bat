@echo off
chcp 65001 > NUL
pushd %~dp0..\..\ComfyUI
call venv\Scripts\activate.bat

python %~dp0comfy_ui_update_config.py %*
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

popd rem %~dp0..\..\ComfyUI
