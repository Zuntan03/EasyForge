@echo off
chcp 65001 > NUL
for /r "%~1" %%i in (*.bat) do ( call "%%i" )
