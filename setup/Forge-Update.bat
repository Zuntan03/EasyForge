@echo off
chcp 65001 > NUL

call %~dp0install\Forge-Install.bat
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

call %~dp0install\Forge-Extension.bat
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

call %~dp0install\Forge-Link.bat
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )
