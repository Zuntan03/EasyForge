@echo off
chcp 65001 > NUL
set DL_HF=%~dp0..\..\..\setup\download\HuggingFace.bat
pushd %~dp0..\..\..\stable-diffusion-webui-forge\models\Lora

@REM https://huggingface.co/alimama-creative/FLUX.1-Turbo-Alpha
call %DL_HF% FluxD-Util\ FLUX.1-Turbo-Alpha-8steps.safetensors alimama-creative/FLUX.1-Turbo-Alpha diffusion_pytorch_model.safetensors?

if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\..\stable-diffusion-webui-forge\models\Lora
