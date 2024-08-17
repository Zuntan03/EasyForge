@echo off
chcp 65001 > NUL

for /r "%~dp0ESRGAN" %%i in (*.bat) do ( call "%%i" )
