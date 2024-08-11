@echo off
chcp 65001 > NUL
cd /d %~dp0..\stable-diffusion-webui-forge
call venv\Scripts\activate.bat
cmd /k
