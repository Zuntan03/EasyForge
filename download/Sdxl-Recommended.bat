@echo off
chcp 65001 > NUL

call %~dp0Sdxl-Minimum.bat

for /r "adetailer" %%i in (*.bat) do ( call "%%i" )
