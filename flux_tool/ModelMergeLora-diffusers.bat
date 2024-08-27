@echo off
call %~dp0ModelMergeLora.bat --diffusers %*
if %ERRORLEVEL% neq 0 ( exit /b 1 )
