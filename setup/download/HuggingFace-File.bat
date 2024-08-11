@echo off
call %~dp0HuggingFace-Curl.bat %*
if %ERRORLEVEL% neq 0 ( exit /b 1 )
