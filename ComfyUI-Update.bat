@echo off
chcp 65001 > NUL

echo call %~dp0setup\ComfyUI-Update.bat
call %~dp0setup\ComfyUI-Update.bat
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )
