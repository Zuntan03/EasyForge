@echo off
chcp 65001 > NUL
set DL_HF=%~dp0..\..\..\setup\download\HuggingFace.bat
pushd %~dp0..\..\..\stable-diffusion-webui-forge\models\VAE

@REM https://huggingface.co/black-forest-labs/FLUX.1-schnell
call %DL_HF% Flux ae.safetensors black-forest-labs/FLUX.1-schnell
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\..\stable-diffusion-webui-forge\models\VAE
