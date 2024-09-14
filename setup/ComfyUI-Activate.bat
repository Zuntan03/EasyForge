@echo off
chcp 65001 > NUL
cd /d %~dp0..\ComfyUI
call venv\Scripts\activate.bat
cmd /k
