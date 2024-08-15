@echo off
chcp 65001 > NUL
set DL_HF=%~dp0..\..\..\setup\download\HuggingFace.bat
pushd %~dp0..\..\..\stable-diffusion-webui-forge\models\VAE

@REM https://huggingface.co/comfyanonymous/flux_text_encoders
call %DL_HF% Flux t5xxl_fp8_e4m3fn.safetensors comfyanonymous/flux_text_encoders
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\..\stable-diffusion-webui-forge\models\VAE
