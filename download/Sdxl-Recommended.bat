@echo off
chcp 65001 > NUL

call %~dp0Sdxl-Minimum.bat

call %~dp0adetailer.bat

call %~dp0wildcards.bat
