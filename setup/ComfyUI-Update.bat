@echo off
chcp 65001 > NUL

call %~dp0install\ComfyUI-Install.bat
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

call %~dp0install\ComfyUI-CustomNode.bat
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

call %~dp0..\download\ComfyUI-Minimum.bat
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

call %~dp0install\ComfyUI-Link.bat
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM minimum DL
