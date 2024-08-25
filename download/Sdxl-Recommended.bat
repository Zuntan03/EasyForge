@echo off
chcp 65001 > NUL

call %~dp0Sdxl-Minimum.bat

call %~dp0all\adetailer.bat
call %~dp0all\wildcards.bat
