@echo off
chcp 65001 > NUL
set DL_HF=%~dp0..\..\..\setup\download\HuggingFace-File.bat
pushd %~dp0..\..\..\stable-diffusion-webui-forge\models\VAE

@REM https://huggingface.co/madebyollin/sdxl-vae-fp16-fix/
call %DL_HF% Sdxl sdxl_vae.safetensors madebyollin/sdxl-vae-fp16-fix
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\..\stable-diffusion-webui-forge\models\VAE
