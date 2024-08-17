@echo off
chcp 65001 > NUL

for /r "%~dp0adetailer" %%i in (*.bat) do ( echo "%%i" & call "%%i" )
