@echo off
chcp 65001 > NUL

for /r "%~dp0wildcards" %%i in (*.bat) do ( call "%%i" )
