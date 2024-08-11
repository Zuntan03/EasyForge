@echo off
chcp 65001 > NUL
pushd %~dp0..\..\stable-diffusion-webui-forge
call venv\Scripts\activate.bat

python %~dp0forge_update_config.py %*

popd rem %~dp0..\..\stable-diffusion-webui-forge
